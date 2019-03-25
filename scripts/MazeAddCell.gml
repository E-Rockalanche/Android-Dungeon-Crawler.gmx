var cell = argument0;
var list1 = argument1;
var list2 = argument2;
var neighbour_grid = argument3;

CellSetTileTemp(cell, TILE.FLOOR);

var i = cell.i;
var j = cell.j;
for(var d = 0; d < 8; d++){
    neighbour_grid[# i+dirs[d,0], j+dirs[d,1]]++;
    }
    
ds_list_add(list1, cell);
ds_list_add(list2, cell);
