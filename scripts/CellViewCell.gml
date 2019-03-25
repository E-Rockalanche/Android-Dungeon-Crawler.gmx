var cell1 = argument0;
var cell2 = argument1;

var i1 = cell1.i;
var j1 = cell1.j;
var i2 = cell2.i;
var j2 = cell2.j;

var dist = CellDistance(cell1, cell2);
var last_cell = cell1;
for(var n = 1; n <= dist; n++){
    var pos = LinePos(i1, j1, i2, j2, n/dist);
    var cur_cell = map[# pos[0], pos[1]];
    
    if (cur_cell.obstructs_view || !ViewDiagFree(cur_cell, last_cell)){
        break;
        }
    }

return (cur_cell == cell2);
