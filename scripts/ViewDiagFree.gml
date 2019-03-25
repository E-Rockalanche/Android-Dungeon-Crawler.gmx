var i1 = argument0.i;
var j1 = argument0.j;
var i2 = argument1.i;
var j2 = argument1.j;

if ((i1 == i2) || (j1 == j2)){
    return true;
    }
//else
var cell1 = map[# i2,j1];
var cell2 = map[# i1,j2];
return !(cell1.obstructs_view && cell2.obstructs_view);
