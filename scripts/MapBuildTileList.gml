var the_map = argument0;
var tile = argument1;

var list = ds_list_create();

for(var i = 0; i < ds_grid_width(the_map); i++){
    for(var j = 0; j < ds_grid_height(the_map); j++){
        var cell = map[# i,j];
        if (cell[| CELL.TILE] == tile){
            ds_list_add(list, cell);
            }
        }
    }
    
return list;
