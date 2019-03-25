var view = argument0;
var i = argument1;
var j = argument2;
var max_radius = argument3 + 0.5;
var add_walls = argument4;
var in_water = argument5;

//  \2|1/
//  3\|/0
//  --@--
//  4/|\7
//  /5|6\

var time = current_time;

ds_list_clear(view);
var mask = ds_grid_create(map_width, map_height);
mask[# i,j] = true//must have
for(var octant = 0; octant < 8; octant++){
    //view data type, center x, center y, max distance, start_column, start slope, end slope, add_walls
    FOVScanOctant(view, mask, i, j, octant, max_radius, 1, 0, 1, add_walls, in_water);
    }
ds_grid_destroy(mask);

show_debug_message("FOV created in "+string(current_time - time)+"ms");
