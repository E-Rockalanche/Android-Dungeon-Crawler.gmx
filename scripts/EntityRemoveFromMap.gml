var entity = argument0;

var size = entity.size;

show_debug_message("Removing "+EntityGetName(entity)+" from position ("+string(entity.i)+", "+string(entity.j)+")");

//remove from old cell
for(var i = 0; i < size; ++i){
    for(var j = 0; j < size; ++j){
        var cur_cell = map[# entity.i+i, entity.j+j];
        cur_cell.entity = -1;
        }
    }
