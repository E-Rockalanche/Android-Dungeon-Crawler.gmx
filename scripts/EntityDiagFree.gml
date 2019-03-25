var entity = argument0;
var cell1 = argument1;
var cell2 = argument2;

var size = entity.size;
var permissions = entity.permissions;

var i1 = cell1.i;
var j1 = cell1.j;
var i2 = cell2.i;
var j2 = cell2.j;

if ((i1 == i2) || (j1 == j2)){
    return true;
    }
    
if (size == 1){
    var cell1 = map[# i1, j2];
    var cell2 = map[# i2, j1];
    return !((!permissions[cell1.tile] && cell1.blocks_diagonal) || (!permissions[cell2.tile] && cell2.blocks_diagonal));
    }
else{
    var left = min(i1, i2);
    var top = min(j1, j2);
    var right = min(i1 + size, i2 + size);
    var bottom = min(j1 + size, j2 + size);
    
    var cell1 = map[# left, top];
    var cell2 = map[# left, bottom];
    var cell3 = map[# right, top];
    var cell4 = map[# right, bottom];
    
    return !((!permissions[cell1.tile] && cell1.blocks_diagonal)
        || (!permissions[cell2.tile] && cell2.blocks_diagonal)
        || (!permissions[cell3.tile] && cell3.blocks_diagonal)
        || (!permissions[cell4.tile] && cell4.blocks_diagonal));
    }
