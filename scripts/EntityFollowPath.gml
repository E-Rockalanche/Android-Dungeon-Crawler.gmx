var entity = argument0;

ASSERT(entity != -1, "Entity does not exist in EntityFollowPath()");

if !ds_stack_empty(entity.path_stack){
    ds_list_add(will_move_list, entity);
    entity.action = ENTITY_ACTION.WILL_MOVE;
    return true;
    }
    
return false;
