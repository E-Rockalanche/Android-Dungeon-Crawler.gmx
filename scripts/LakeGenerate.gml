show_debug_message("--- LakeGenerate() ---");

//returns ds_grid with a blob of alive cells with no border

var gen_width = argument[0];
var gen_height = argument[1];
var min_lake_size = argument[2];
var max_lake_size = argument[3];
var chance = 45;
if (argument_count > 4){
    chance = argument[4];
    }

var trys = 0;
do{
    //generate blobs
    var grid = GenerateBlobs(gen_width, gen_height, chance);
    
    //find largest valid blob
    var num_lakes = 0;
    var lakes;
    var max_size = 0;
    var largest_lake_id = -1;
    //flood fill all blobs with unique IDs
    for(var i = 1; i < gen_width-1; i++){
        for(var j = 1; j < gen_height-1; j++){
            if (grid[# i,j] == 1){
                var lake_dims = LakeFloodFill(grid, i, j, num_lakes+2);
                lakes[num_lakes] = lake_dims;
                var cur_size = lake_dims[2]*lake_dims[3];
                if (cur_size > max_size){
                    if ((lake_dims[2] <= max_lake_size) && (lake_dims[3] <= max_lake_size) && (lake_dims[2] >= min_lake_size) && (lake_dims[3] >= min_lake_size)){
                        largest_lake_id = num_lakes;
                        max_size = cur_size;
                        }
                    }
                num_lakes++;
                }
            }
        }
    if (largest_lake_id == -1){
        ds_grid_destroy(grid);
        }
    trys++;
    }until(largest_lake_id != -1);

//set smaller blobs to 0
var value = largest_lake_id+2; 
for(var i = 1; i < gen_width-1; i++){
    for(var j = 1; j < gen_height-1; j++){
        if (grid[# i,j] != value){
            grid[# i,j] = 0;
            }
        }
    }

//copy largest lake onto seperate grid
var lake_dims = lakes[largest_lake_id];
show_debug_message("Lake made on iteration "+string(trys));
show_debug_message("Lake dimensions = "+string(lake_dims[2])+"x"+string(lake_dims[3]));
var lake = ds_grid_create(lake_dims[2], lake_dims[3]);
ds_grid_set_grid_region(lake, grid, lake_dims[0], lake_dims[1], lake_dims[0]+lake_dims[2]-1, lake_dims[1]+lake_dims[3]-1, 0, 0);

//finished
ds_grid_destroy(grid);
return lake;
