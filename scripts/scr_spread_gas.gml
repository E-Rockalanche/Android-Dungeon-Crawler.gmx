show_debug_message("scr_spread_gas()");

var cur_size = ds_list_size(gas_list);
if (cur_size == 0){
    exit;
    }

var time = current_time;

var new_gas_density_grid = ds_grid_create(map_width, map_height);
var new_gas_type_grid = ds_grid_create(map_width, map_height);

//will only iterate through the cells that are in the list right now, not cells added to the list in this loop
for(var n = 0; n < cur_size; ++n){
    var cell = gas_list[| n];
    var i = cell.i;
    var j = cell.j;
    
    var cur_gas_type = gas_type_grid[# i,j];
    
    //var total_gas_density = gas_density_grid[# i,j];
    var total_volume = 1 + (cell.tile == TILE.PIT);
    
    //find open neighbours
    var neighbours = ds_list_create();
    for(var d = 0; d < 8; ++d){
        var ii = i+dirs[d,0];
        var jj = j+dirs[d,1]
        var neighbour = map[# ii,jj];
        if !(BL(neighbour.tile) & TILE_OBSTRUCTS_GAS){
            if DiagFree(cell, neighbour){
                ds_list_add(neighbours, neighbour);
                }
            }
        }
        
    //calculate density to add to neighbours
    var list_size = ds_list_size(neighbours);
    total_volume += list_size;
    var new_density = gas_density_grid[# i,j]/total_volume;
    
    //spread gas to neighbours
    for(var nn = 0; nn <  list_size; ++nn){
        var neighbour = neighbours[| nn];
        var ii = neighbour.i;
        var jj = neighbour.j;
        var cur_density = gas_density_grid[# ii, jj];
        if (new_density > cur_density){
            if (cur_density == 0){
                if (new_gas_type_grid[# ii,jj] == 0) && (gas_type_grid[# ii,jj] == 0){
                    //add cell to list if it doesn't have a new gas type or an old gas type
                    ds_list_add(gas_list, neighbour);
                    }
                }
            new_gas_type_grid[# ii, jj] = cur_gas_type;
            }
        new_gas_density_grid[# ii,jj] += new_density;
        }
    ds_list_destroy(neighbours);
        
    //update own density
    new_gas_density_grid[# i,j] += new_density;
    new_gas_type_grid[# i,j] = cur_gas_type;
    }

ds_grid_destroy(gas_density_grid);
ds_grid_destroy(gas_type_grid);
gas_density_grid = new_gas_density_grid;
gas_type_grid = new_gas_type_grid;
    
//remove gas from all cells with low density
for(var n = 0; n < ds_list_size(gas_list); ++n){
    var cell = gas_list[| n];
    var i = cell.i;
    var j = cell.j;
    if (gas_density_grid[# i,j] <= 1){
        gas_density_grid[# i,j] = 0;
        gas_type_grid[# i,j] = 0;
        ds_list_delete(gas_list, n);
        n--;
        }
    }
    

show_debug_message("took "+string(current_time - time)+" milliseconds");
