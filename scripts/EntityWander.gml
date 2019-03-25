var entity = argument[0];
var dir = entity.current_direction;
if (argument_count > 1){
    dir = argument[1];
    show_debug_message("--- EntityWander("+EntityGetName(entity)+", "+string(dir)+") ---");
    }
else{
    show_debug_message("--- EntityWander("+EntityGetName(entity)+") ---");
    }
    
var size = entity.size;

var options = ds_priority_create();
for(var d = 0; d < 8; d++){
    var i = entity.i + dirs[d,0];
    var j = entity.j + dirs[d,1];
    if ((i >= 0) && (j >= 0) && (i+size-1 < map_width) && (j+size-1 < map_height)){
        //
        var cell = map[# i,j];
        if (EntityPosFree(entity, i, j) && EntityDiagFree(entity, entity.cell, cell)){
            var diff = AngleDifference(d*45, dir);
            show_debug_message("diff between "+string(d*45)+" and "+string(dir)+" = "+string(diff));
            ds_priority_add(options, cell, diff);
            }
        }
    }
    
if (ds_priority_size(options) > 0){
    var cell = ds_priority_find_min(options);
    
    ds_stack_clear(entity.path_stack);
    ds_stack_push(entity.path_stack, cell);
    
    ds_list_add(will_move_list, entity);
    ds_priority_destroy(options);
    entity.action = ENTITY_ACTION.WILL_MOVE;
    
    return true;
    }
else{
    ds_priority_destroy(options);
    
    return false;
    }
    
