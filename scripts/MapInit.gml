var map_width = argument0;
var map_height = argument1;

show_debug_message("--- MapInit( "+string(map_width)+", "+string(map_height)+" ) ---");

var new_map = ds_grid_create(map_width, map_height);

for(var i = 0; i < map_width; i++){
    for(var j = 0; j < map_height; j++){
        var cell = CellCreate(i, j);
        new_map[# i,j] = cell;
        if ((i == 0) || (j == 0) || (i == map_width-1) || (j == map_height-1)){
            CellSetTileTemp(cell, TILE.WALL);
            cell.permanent = true;
            }
        }
    }
    
return new_map;
