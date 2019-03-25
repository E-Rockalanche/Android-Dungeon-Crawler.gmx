//calculates a square FOV from the 8 octants

/*

var source_i = argument[0];
var source_j = argument[1];
var max_dist = argument[2];
    
show_debug_message("GetFOV");

var mask = ds_grid_create(map_width,map_height);
mask[# source_i,source_j] = true;

for(var octant = 0; octant < 8; octant++){
    GetOctantFOV(source_i, source_j, octant, max_dist, mask);
    }
//CellSetVisible(map[# source_i,source_j]);

return mask;
