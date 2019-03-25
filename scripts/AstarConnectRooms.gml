var link_list, door_chance;
var perlin_spacing, perlin_coef, perlin_floor;

link_list = argument[0];//destroys link list
door_chance = 60;
if (argument_count > 1){
    door_chance = argument[1];
    }
perlin_spacing = 0;
perlin_coef = 0;
if (argument_count > 3){
    perlin_spacing = argument[2];
    perlin_coef = argument[3];
    }
perlin_floor = 0.5;
if (argument_count > 4){
    perlin_floor = argument[4];
    }

show_debug_message("Number of Hallways to make = "+string(ds_list_size(link_list)));

//var rand_grid = CreateRandomGrid(randomness);
var rand_grid = ds_grid_create(width, height);
//PerlinAddNoise(rand_grid, max(1, floor(width/perlin_spacing)), perlin_coef, perlin_floor);

for(var n = 0; n < ds_list_size(link_list); n++){
    var link = link_list[| n];
    var room1 = link[? 0];
    var room2 = link[? 1];
    ds_map_destroy(link);
    
    if room1[? ROOM.TREASURE_ROOM]{
        TreasureRoomFreeWalls(room1);
        show_debug_message("Connecting treasure room to map");
        }
    
    show_debug_message("Connecting rooms "+string(room1)+", (type "+string(room1[? ROOM.TYPE])+") and "+string(room2)+", (type "+string(room2[? ROOM.TYPE])+")");
    
    var start = room1[? ROOM.CENTER];
    var goal = room2[? ROOM.CENTER];
    
    if AstarFindHallway(start, goal, rand_grid){
        var cell = goal;
        var max_path_length = width*height;
        var length = 0;
        
        do{
            if (cell == -1){
                ASSERT(false, "cell == -1 in AstarCreateHallways, (step = "+string(length)+")");
                break;
                }
            
            if (cell == start){
                show_debug_message("Connected. Path length: "+string(length));
                break;
                }
            
            switch(cell.tile){
                case TILE.WALL:
                    if cell.in_treasure_room{
                        CellSetTileTemp(cell, room1[? ROOM.LOCK]);
                        }
                    else if ((cell.is_room_border) && Chance(door_chance)){
                        CellSetTileTemp(cell, TILE.DOOR_CLOSED);
                        //CellMakeDoor(cell);
                        }
                    else{
                        CellSetTileTemp(cell, TILE.FLOOR);
                        }
                    break;
                
                case TILE.WATER:
                case TILE.PIT:
                case TILE.LAVA:
                    var tile;
                    if (cell.bridge_length > 0){
                        tile = TILE.BRIDGE;
                        }
                    else{
                        tile = TILE.FLOOR;
                        }
                    CellSetTileTemp(cell, tile);
                    break;
                }
            cell.in_hallway = true;
            
            var temp = cell;
            cell = cell.parent;
            temp.parent = -1;//safeguard
            
            length++;
            }until(length == max_path_length);
            
        if (cell != start){
            ASSERT(false, "Goal node found but could not go back to start node within "+string(max_path_length)+" steps");
            }
        }
    else{
        ASSERT(false, "Could not find a hallway between room "+string(room1)+" and room "+string(room2));
        }
    
    if room1[? ROOM.TREASURE_ROOM]{
        //lock walls so other treasure rooms don't dig hallways through previous ones
        TreasureRoomLockWalls(room1);
        }
    }
ds_list_destroy(link_list);
ds_grid_destroy(rand_grid);
