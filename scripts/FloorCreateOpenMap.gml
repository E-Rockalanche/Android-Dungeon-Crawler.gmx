var cur_floor = argument0;

show_debug_message("----------------------------- FloorCreateOpenMap() -----------------------------");

random_set_seed(cur_floor.seed);
show_debug_message("Set seed to "+string(cur_floor.seed)+" for depth "+string(cur_floor.floor_depth));

var width = cur_floor.width;
var height = cur_floor.height;

var new_map = MapInit(width, height);
cur_floor.map = new_map;

for(var i = 1; i < width-1; i++){
    for(var j = 1; j < height-1; j++){
        var cell = new_map[# i,j];
        CellSetTileTemp(cell, TILE.FLOOR);
        }
    }
    
MapClean(new_map);

var i = irandom_range(1, width-2);
var j = irandom_range(1, height-2);

cur_floor.stairs_up = new_map[# i,j];
CellSetTile(cur_floor.stairs_up, TILE.STAIRS_UP, true);

show_debug_message("--- MAP COMPLETE ---");
