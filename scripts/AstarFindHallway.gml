var entity, start, goal, open_list, closed_list, it, rand_grid;

start = argument0;
goal = argument1;
rand_grid = argument2;

start.current_direction = -1;
start.hallway_length = 0;
start.bridge_length = 0;
start.straight_length = 0;
start.building_bridge = false;
start.dug_new_hallway = false;

long_hallway_length = 6;

ASSERT(start != -1, "No start in MapAstarFindHallway()");
ASSERT(goal != -1, "No goal in MapAstarFindHallway()");

var H_cost = 10;//Hueristic cost
var open_cost = 10;//cost to move through non solid tile outside rooms
var wall_cost = open_cost;//cost to dig through wall outside rooms
var turn_cost = wall_cost;//cost to change hallway direction
var double_turn_cost = turn_cost*4;//cost to change direction twice in a row
var hallway_connection_cost = open_cost*8;//stops Astar from making small loops
var border_cost = 0;//cost to dig through room border
var bridge_cost = wall_cost*2;//cost to go straight through lake
var premade_bridge_cost = open_cost div 2;//low cost to go over bridge so that new ones are avoided
var lake_cost = wall_cost*8;//cost to go through lake without bridge
var shore_cost = wall_cost*6;//lake next to wall
var short_hallway_cost = wall_cost*20;//cost to build hallway shorter than MIN_HALL_LENGTH
var long_straight_hallway_cost = turn_cost*10;

//var rand_cost = wall_cost*(3+1) + turn_cost*2;//random cost to add hallway curvyness
//var prime1 = 13;
//var prime2 = 19;

start.G = 0;
start.H = TaxicabHCost(start, goal);
start.F = start.H;

open_list = ds_priority_create();
ds_priority_add(open_list, start, start.F);
closed_list = ds_list_create();
    
it = 0;
while((ds_priority_size(open_list) > 0) && (it < width*height))
    {
    var cur_cell = ds_priority_delete_min(open_list);
    
    //this cell has now been checked
    cur_cell.closed = true;
    cur_cell.open = false;
    ds_list_add(closed_list,cur_cell);
    
    //found goal
    if (cur_cell == goal){
        AstarResetOpenList(open_list);
        AstarResetClosedList(closed_list);
        return true;
        }
        
    var i = cur_cell.i;
    var j = cur_cell.j;
    
    //add neighbours to open list
    for(var d = 0; d < 8; d += 2)
        {
        var new_i = i + dirs[d,0];
        var new_j = j + dirs[d,1];
        var cell = map[# new_i, new_j];
        
        if (cell.closed || (cell.permanent && (cell.tile == TILE.WALL)) || !PosInBox(new_i, new_j, 1, 1, width-2, height-2)){
            //not allowed through checked cells, permanent walls, or outside map boundry
            continue;
            }
        
        var tile = cell.tile;
        
        //cannot pass through 2 consecutive room border walls
        var is_room_border = cell.is_room_border;
        if (is_room_border){
            if (cur_cell.is_room_border){
                continue;
                }
            }
        
        var cur_dir = (point_direction(cur_cell.i, cur_cell.j, cell.i, cell.j) div 45);
        var last_dir = cur_cell.current_direction;
        
        var cur_parent = cur_cell.parent;
        var last_dir2 = last_dir;
        if (cur_parent != -1){
            var last_dir2 = (point_direction(cur_parent.i, cur_parent.j, cur_cell.i, cur_cell.j) div 45);
            }
        
        
        //building off a bridge tile
        var building_bridge = (cur_cell.bridge_length > 0);
        if (building_bridge){
            if ((cur_dir != last_dir)){
                //stop if not building a straight bridge
                continue;
                }
            else if !(BL(tile) & TILE_IS_LAKE){
                if (cur_cell.bridge_length < MIN_BRIDGE_LENGTH){
                    //stop if bridge is not long enough
                    continue;
                    }
                else{
                    //no longer building bridge (bridge satisfies requirements)
                    building_bridge = false;
                    }
                }
            }
        
        var new_G = cur_cell.G;
        
        //extra cost to start new hallway
        var in_room = cell.in_room;
        if (!cell.in_hallway && !in_room){
            var found_hallway = false;
            for(var dd = 0; dd < 8; dd += 2){
                var neighbor = map[# new_i+dirs[dd,0], new_j+dirs[dd,1]];
                if (neighbor.in_hallway || neighbor.in_room){
                    new_G += hallway_connection_cost;
                    found_hallway = true;
                    }
                }
            if !found_hallway{
                for(var dd = 1; dd < 8; dd += 2){
                    var neighbor = map[# new_i+dirs[dd,0], new_j+dirs[dd,1]];
                    if (neighbor.in_hallway || neighbor.in_room){
                        new_G += hallway_connection_cost/2;
                        found_hallway = true;
                        }
                    }
                }
            }
        
        switch(tile){
            case TILE.WALL:
                var rand = rand_grid[# new_i, new_j];
                ASSERT(rand >= 0, "***ERROR: Rand is less than 0");
                new_G += wall_cost + border_cost*(cell.is_room_border) + rand;
                
                if (cur_cell.tile == TILE.WALL){
                    if (cur_dir != last_dir){
                        if (last_dir != last_dir2){
                            //double turn
                            new_G += double_turn_cost;
                            }
                        else{
                            new_G += turn_cost;
                            }
                        }
                    else if (cur_cell.straight_length >= long_hallway_length){
                        new_G += long_straight_hallway_cost;
                        }
                    }
                
                //var num1 = new_i + new_j*width;
                //var num2 = new_j + new_i*height;
                //increases path curvyness
                //new_G += rand_cost*(((num1 mod prime1) == 0) || ((num2 mod prime2) == 0));
                break;
            
            case TILE.WATER:
            case TILE.PIT:
            case TILE.LAVA:
                if !building_bridge{
                    building_bridge = CanBuildBridge(cur_cell, cur_dir);
                    }
                if building_bridge{
                    var cost_factor = 1;
                    for(var n = -1; n <= 1; n += 2){
                        var neighbor = map[# new_i + dirs[d,1]*n, new_j + dirs[d,0]*n];
                        cost_factor += 1*(neighbor.tile == TILE.WALL) + 1*(neighbor.tile == TILE.FLOOR) + 10*(neighbor.tile == TILE.BRIDGE);
                        }
                    new_G += bridge_cost*cost_factor;//max(0, bridge_cost*cost_factor - cur_cell.bridge_length*2);
                    }
                else{
                    var found_wall = false;
                    for(var dd = 0; dd < 8; dd++){
                        var other_cell = map[# new_i+dirs[dd,0], new_j+dirs[dd,1]];
                        if (other_cell.tile == TILE.WALL){
                            found_wall = true;
                            break;
                            }
                        }
                    new_G += shore_cost*(found_wall) + lake_cost*(!found_wall);
                    }
                break;
            
            case TILE.FLOOR:
                if !cell.is_room_border{
                    new_G += open_cost;
                    }
                break;
                
            case TILE.BRIDGE:
                new_G += premade_bridge_cost;
                break;
            }
            
        
        if is_room_border{
            new_G += short_hallway_cost*(cur_cell.dug_new_hallway)*(!cell.in_hallway)*((cur_cell.hallway_length < MIN_HALL_LENGTH));
            }
        
        
        if (!cell.open && !cell.closed) || (new_G < cell.G){
            cell.current_direction = cur_dir;
            cell.bridge_length = (cur_cell.bridge_length + 1)*(building_bridge);
            cell.hallway_length = (cur_cell.hallway_length + 1)*(!is_room_border && !in_room);
            cell.dug_new_hallway = ((!cell.in_hallway || cur_cell.dug_new_hallway) && !in_room && !is_room_border);
            cell.straight_length = 1 + (cur_cell.straight_length)*(cur_dir == last_dir);
            AstarCellSet(cell, new_G, TaxicabHCost(cell, goal)*H_cost, cur_cell, open_list, closed_list);
            }
        }
    it++;
    }
ASSERT(it < width*height, "***ERROR: Astar stuck in infinite loop");

AstarResetOpenList(open_list);
AstarResetClosedList(closed_list);
show_debug_message("MapAstarFindHallway failed to find goal node in "+string(it)+" iterations");
return false;
