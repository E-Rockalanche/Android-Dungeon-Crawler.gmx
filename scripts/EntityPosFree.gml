var entity = argument0;
var check_i = argument1;
var check_j = argument2;

//collision, permission, and entity checking (not moving entities)

var size = entity.size;

for(var n = 0; n < size*size; n++){
    var i = check_i + (n mod size);
    var j = check_j + (n div size);
    var cell = map[# i,j];
    
    if !entity.permissions[cell.tile]{
        return false;
        }
    
    var other_entity = cell.entity;
    if ((other_entity != -1) && (other_entity != entity)){
        if (other_entity.action != ENTITY_ACTION.WILL_MOVE){
            return false;
            }
        }
    }

return true;
