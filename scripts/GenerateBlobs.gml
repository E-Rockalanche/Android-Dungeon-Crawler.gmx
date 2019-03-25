var gen_width = argument0;
var gen_height = argument1;
var chance = argument2;

show_debug_message("GenerateBlobs("+string(gen_width)+","+string(gen_height)+","+string(chance)+")");

var grid = ds_grid_create(gen_width, gen_height);
var buff = ds_grid_create(gen_width, gen_height);
for(var i = 0; i < gen_width; i++){
    for(var j = 0; j < gen_height; j++){
        grid[# i,j] = (Chance(chance) && !((i == 0) || (j == 0) || (i == gen_width-1) || (j == gen_height-1)));
        }
    }
repeat(6){
    //create buff
    for(var i = 1; i < gen_width-1; i++){
        for(var j = 1; j < gen_height-1; j++){
            num_alive = 0;
            
            for(var d = 0; d < 8; d++){
                num_alive += grid[# i+dirs[d,0], j+dirs[d,1]];
                }
            
            if (num_alive >= (4 + !grid[# i,j])){
                buff[# i,j] = true;
                }
            else{
                buff[# i,j] = false;
                }
            }
        }
    
    //copy buff onto grid
    ds_grid_set_grid_region(grid, buff, 0, 0, gen_width-1, gen_height-1, 0, 0);
    }
ds_grid_destroy(buff);

return grid;
