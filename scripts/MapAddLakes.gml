var new_map = argument0;
var num_lakes = argument1;

show_debug_message("--- MapAddLakes( "+string(num_lakes)+" ) ---");

repeat(num_lakes){
    var lake = LakeGenerate(round(MAX_LAKE_SIZE*3/2), round(MAX_LAKE_SIZE*3/2), MIN_LAKE_SIZE, MAX_LAKE_SIZE);
    var lake_width = ds_grid_width(lake);
    var lake_height = ds_grid_height(lake);
    var place_x = irandom(width-2 - lake_width) + 1;
    var place_y = irandom(height-2 - lake_height) + 1;
    for(var i = 0; i < lake_width; i++){
        for(var j = 0; j < lake_height; j++){
            if (lake[# i,j] != 0){
                var cell = new_map[# i+place_x, j+place_y];
                switch(cell.tile){
                    case TILE.WALL:
                        if !cell.in_treasure_room{
                            cell.permanent = false;
                            CellSetTileTemp(cell, TILE.WATER);
                            }
                        break;
                    
                    case TILE.FLOOR:
                        if (Chance(15) && !cell.in_treasure_room){
                            cell.permanent = false;
                            CellSetTileTemp(cell, TILE.WATER);
                            }
                        break;
                    
                    }
                }
            }
        }
    ds_grid_destroy(lake);
    }
//corrode floors
show_debug_message("Smoothing lakes, walls, and floors");
MapSmoothArea(0, 0, width, height, TILE.WATER, TILE.FLOOR, 3, 4, 3, false);
MapSmoothArea(0, 0, width, height, TILE.WALL, TILE.WATER, 3, 5, 2, true);
