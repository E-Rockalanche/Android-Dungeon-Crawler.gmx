show_debug_message("--- MapMakeMaze() ---");

var new_map = argument0;

var floor_list = ds_list_create();
var maze_stack = ds_stack_create();

var loop_chance = 5;
var bridge_chance = 20;
var min_bridge_length = 3;

var dig_into_rooms = true;

//find wall cell to start on
var i, j, root;
do{
    i = irandom_range(1, width-2);
    j = irandom_range(1, height-2);
    root = new_map[# i,j];
    }until((root.tile == TILE.WALL) && !root.is_room_border && !root.permanent);

ds_list_add(floor_list, root);
ds_stack_push(maze_stack, root);
CellSetTileTemp(root, TILE.FLOOR);
root.in_hallway = true;

var noise = ds_grid_create(width, height);
PerlinAddNoise(noise, 16, 100, 0);

var options = ds_list_create();
//var options = ds_priority_create();
while(ds_stack_size(maze_stack) > 0){
    var cell = ds_stack_top(maze_stack);
    var i = cell.i;
    var j = cell.j;
    
    //get options
    for(var d = 0; d < 8; d += 2){
        var ii = dirs[d,0];
        var jj = dirs[d,1];
        
        var dist = 2;
        var found_floor = false;
        var ok = true;
        var found_lake = false;
        var bridge_length = 0;
        for(var n = 1; n <= dist; n++){
            var iii = i+ii*n;
            var jjj = j+jj*n;
            
            //check if position is in map
            if PosInBoundry(iii, jjj, 1, 1, width-2, height-2){
                var cell = new_map[# i+n*ii, j+n*jj];
                if cell.permanent{
                    ok = false;
                    break;
                    }
                if (BL(cell.tile) & TILE_IS_LAKE){
                    //check if potential bridge is next to walls
                    var lcell = new_map[# iii+jj, jjj+ii];
                    var rcell = new_map[# iii-jj, jjj-ii];
                    if ((lcell.tile == TILE.WALL) || (rcell.tile == TILE.WALL)){
                        ok = false;
                        break;
                        }
                
                    if !found_lake{
                        //found a lake while searching this direction
                        
                        //check if it's ok to make a bridge
                        if !Chance(bridge_chance){
                            //failed to make a bridge
                            ok = false;
                            break;
                            }
                        else{
                            //will make a bridge
                            found_lake = true;
                            }
                        }
                    bridge_length++;
                    //extend search if going over a lake and on "potential stack cell"
                    if (n == dist){
                        dist += 2;
                        }
                    }
                else if (cell.tile == TILE.FLOOR){
                    found_floor = true;
                    if (cell.in_room && !dig_into_rooms){
                        //cannot dig maze into rooms
                        //only rooms can dig into mazes
                        ok = false;
                        break;
                        }
                    if ((n < dist) && (!cell.in_room || !dig_into_rooms)){
                        //this is already a dug path
                        ok = false;
                        break;
                        }
                    }
                else if (cell.tile == TILE.BRIDGE){
                    ok = false;
                    break;
                    }
                else if (cell.tile == TILE.WALL){
                    if (cell.is_room_border && !dig_into_rooms){
                        ok = false;
                        break;
                        }
                    }
                }
            else{
                ok = false;
                break;
                }
            }
        if ok{
            if ((!found_floor || Chance(loop_chance)) && (!found_lake || (bridge_length >= min_bridge_length))){
                ds_list_add(options, d);
                //ds_priority_add(options, d, noise[# i+ii, j+jj]);
                }
            }
        }
    
    //choose an options
    if (ds_list_size(options) > 0){
    //if (ds_priority_size(options) > 0){
        var dir = ds_list_get_random(options);
        //var dir = ds_priority_delete_min(options);
        var dist = 2;
        for(var n = 1; n <= dist; n++){
            var cell = new_map[# i+n*dirs[dir,0], j+n*dirs[dir,1]];
            ds_list_add(floor_list, cell);
            if (BL(cell.tile) & TILE_IS_LAKE){
                if (n == dist){
                    dist += 2;
                    }
                CellSetTileTemp(cell, TILE.BRIDGE);
                cell.in_hallway = true;
                }
            else{
                if ((n == dist) && (cell.tile == TILE.WALL) && !cell.is_room_border){
                    ds_stack_push(maze_stack, cell);
                    }
                CellSetTileTemp(cell, TILE.FLOOR);
                cell.in_hallway = true;
                }
            }
        }
    else{
        //go back one cell if there are no options
        ds_stack_pop(maze_stack);
        }
    ds_list_clear(options);
    //ds_priority_clear(options);
    }
ds_list_destroy(options);
//ds_priority_destroy(options);
ds_stack_destroy(maze_stack);

return floor_list;
