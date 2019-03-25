show_debug_message("--- scr_clean_map() ---");

var num_fixed = 0;

for(var i = 1; i < width-1; i++){
    for(var j = 1; j < height-1; j++){
        var cell = map[# i,j];
        var tile = cell.tile;
            
        switch(tile){
            
            case TILE.WALL:
                //remove diagonal openings
                //  #.      .#
                //  .#  or  #.
                for(var k = 1; k >= -1; k -= 2){
                    var right = map[# i+1,j];
                    if (right.tile != TILE.WALL){
                        var down = map[# i,j+k];
                        if (down.tile != TILE.WALL){
                            var down_right = map[# i+1,j+k];
                            if (down_right.tile == TILE.WALL){
                                cell.permanent = false;
                                CellSetTileTemp(cell, right.tile);
                                num_fixed++;
                                }
                            }
                        }
                    }
                break;
            
            case TILE.BRIDGE:
            case TILE.WATER:
                //remove singles
                var num_same = 0;
                for(var d = 0; d < 8; d += 2){
                    var cur_cell = map[# i+dirs[d,0], j+dirs[d,1]];
                    num_same += ((cur_cell.tile == tile) || ((cur_cell.tile == TILE.DOOR_CLOSED) && (tile == TILE.WALL)));
                    }
                if (num_same == 0){
                    var new_tile;
                    switch(tile){
                        case TILE.BRIDGE:
                        case TILE.WATER:
                            new_tile = TILE.FLOOR;
                            break;
                        
                        default:
                            //in case more cases are added to single tile removal
                            var rand_dir = irandom(7);
                            var cur_cell = map[# i+dirs[rand_dir,0], j+dirs[rand_dir,1]];
                            new_tile = cur_cell.tile;
                            break;
                        }
                    cell.permanent = false;
                    CellSetTileTemp(cell, new_tile);
                    num_fixed++;
                    }
                break;
            
                
            case TILE.DOOR_CLOSED:
                //remove doors with no proper walls
                for(var d = 0; d <= 2; d += 2){
                    var cell1 = map[# i+dirs[d,0], j+dirs[d,1]];
                    var cell2 = map[# i-dirs[d,0], j-dirs[d,1]];
                    var tile1 = cell1.tile;
                    var tile2 = cell2.tile;
                    if (tile1 != tile2) && ((tile1 == TILE.WALL) || (tile2 == TILE.WALL)){
                        cell.permanent = false;
                        CellSetTileTemp(cell, TILE.FLOOR);
                        num_fixed++;
                        break;
                        }
                    }
                break;
            }
        }
    }
    
show_debug_message("Fixed "+string(num_fixed)+" problems");
