var chance = argument0;

show_debug_message("CreateRandomGrid( "+string(chance)+" )");

var grid = ds_grid_create(width, height);
for (var i = 0; i < width; i++){
    for(var j = 0; j < height; j++){
        grid[# i,j] = Chance(chance)*100;
        }
    }

return grid;
