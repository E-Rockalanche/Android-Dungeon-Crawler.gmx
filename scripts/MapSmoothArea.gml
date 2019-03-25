var left = argument[0];
var top = argument[1];
var area_width = argument[2];
var area_height = argument[3];

var alive_tile = argument[4];
var dead_tile = argument[5];

var alive_amount = argument[6];//amount of alive cells needed to stay alive
var dead_amount = argument[7];//amount of alive cells needed to become alive

var iterations = argument[8];

var hug_walls = false;
if (argument_count > 9){
    hug_walls = argument[9];
    }
    
show_debug_message("Smoothing area ("+string(left)+", "+string(top)+", "+string(area_width)+", "+string(area_height)+") over "+string(iterations)+" iterations");

//alive grids
var old_grid = ds_grid_create(area_width, area_height);
var new_grid = ds_grid_create(area_width, area_height);

//copy map cells to new_grid
for(var i = 0; i < area_width; i++){
    for(var j = 0; j < area_height; j++){
        var cell = map[# i+left, j+top];
        if (cell.tile == alive_tile){
            new_grid[# i,j] = 1;
            }
        else if (cell.tile == dead_tile){
            new_grid[# i,j] = -1;
            }
        else{
            new_grid[# i,j] = 0;//neither alive nor dead tile type
            }
        if (cell.permanent){
            new_grid[# i,j] *= 2;//do not smooth permanent tiles
            }
        }
    }

//smooth area
repeat(iterations){
    //copy old grid
    for(var i = 0; i < area_width; i++){
        for(var j = 0; j < area_height; j++){
            old_grid[# i,j] = new_grid[# i,j];
            }
        }
    
    //smooth new grid
    for(var i = 1; i < area_width-1; i++){
        for(var j = 1; j < area_height-1; j++){
            if (abs(old_grid[# i,j]) != 1){
                continue;
                }
            
            var num_alive = 0;
            for(var d = 0; d < 8; d++){
                num_alive += (old_grid[# i+dirs[d,0], j+dirs[d,1]] > 0);
                num_alive += (old_grid[# i+dirs[d,0], j+dirs[d,1]] == 0)*(hug_walls);
                }
                
            if (old_grid[# i,j] == 1){//if alive
                new_grid[# i,j] = -1 + 2*(num_alive >= alive_amount);
                }
            else{//if dead
                new_grid[# i,j] = -1 + 2*(num_alive >= dead_amount);
                }
            }
        }
    }
    
//copy new_grid to map cells
for(var i = 1; i < area_width-1; i++){
    for(var j = 1; j < area_height-1; j++){
        var cell = map[# i+left,j+top];
        if (new_grid[# i,j] == 1){
            CellSetTileTemp(cell, alive_tile);
            }
        else if (new_grid[# i,j] == -1){
            CellSetTileTemp(cell, dead_tile);
            }
        }
    }

//finished
ds_grid_destroy(old_grid);
ds_grid_destroy(new_grid);
