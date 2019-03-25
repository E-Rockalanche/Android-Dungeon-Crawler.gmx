var i = argument0;
var j = argument1;
var type = argument2;
var density = argument3;

var cur_density = gas_density_grid[# i,j];

if (cur_density == 0){
    //there is no gas here
    ds_list_add(gas_list, map[# i,j]);
    }

if (cur_density <= density){
    //set new gas type if new density is greater than current density
    gas_type_grid[# i,j] = type;
    }

gas_density_grid[# i,j] += density;
