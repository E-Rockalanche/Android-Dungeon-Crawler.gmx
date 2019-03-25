var entity = argument0;
var check_i = argument1;
var check_j = argument2;

var size = entity.size;
if (size == 1){
    return entity.permissions[map[# check_i, check_j].tile];
    }

for(var n = 0; n < size*size; ++n){
    var i = check_i + (n mod size);
    var j = check_j + (n div size);
    if !entity.permissions[map[# i,j].tile]{
        return false;
        }
    }

return true;
