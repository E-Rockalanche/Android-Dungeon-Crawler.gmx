var map = argument0;

var map_width = ds_grid_width(map);
var map_height = ds_grid_height(map);

for(var i = 0; i < map_width; i++){
    for(var j = 0; j < map_height; j++){
        CellDestroy(map[# i,j]);
        }
    }
ds_grid_destroy(map);
