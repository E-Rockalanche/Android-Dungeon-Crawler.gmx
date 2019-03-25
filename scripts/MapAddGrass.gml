var new_map = argument[0];

var grass_chance, tall_grass_chance;
if (argument_count > 1){
    grass_chance = argument[1];
    }
else{
    grass_chance = irandom_clump(60,2);
    }
if (argument_count > 2){
    tall_grass_chance = argument[2];
    }
else{
    tall_grass_chance = irandom_clump(60,2);
    }
    
show_debug_message("--- MapAddGrass( "+string(grass_chance)+", "+string(tall_grass_chance)+" ) ---");

var grass_grid = GenerateBlobs(width, height, grass_chance);
var tall_grass_grid = GenerateBlobs(width, height, tall_grass_chance);
for(var i = 1; i < width-1; i++){
    for(var j = 1; j < height-1; j++){
        var cell = new_map[# i,j];
        if (cell.tile == TILE.FLOOR){
            if grass_grid[# i,j]{
                if tall_grass_grid[# i,j]{
                    CellSetTileTemp(cell, TILE.TALL_GRASS);
                    }
                else{
                    CellSetTileTemp(cell, TILE.GRASS);
                    }
                }
            }
        }
    }
ds_grid_destroy(grass_grid);
ds_grid_destroy(tall_grass_grid);
