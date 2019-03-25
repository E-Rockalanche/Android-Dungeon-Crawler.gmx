while(ds_list_size(decide_list) > 0){
    var entity = ds_list_delete_return(decide_list,0);
    show_debug_message("Entity deciding: "+entity.name);
    
    ASSERT(EntityIsAlive(entity),"Entity dead or nonexistant in scr_ai_decide()");
    
    //EntityFindTarget(entity);
    
    var cur_cell = entity.cell;
    var target = entity.target;
    
    entity.action = ENTITY_ACTION.UNDECIDED;
    
    /*
    if (!entity.permissions[cell[| CK.type]]){//in a tile the entity would not normally walk on
        show_debug_message(entity.name+" is on a non-permissable cell");
        DijkstraGetPath(entity, -1, cell[| CK.type]);
        ds_list_add(move_list,entity);
        }
    */
    
    if (target != -1){
        if EntityCanAttackTarget(entity, target){
            //attack
            EntitySetupAttack(entity);
            exit;
            }
        else if (entity.in_view){//can see target (only player right now)
            if EntityTryStraightPathTo(entity, target.cell){
                ds_list_add(will_move_list, entity);
                entity.action = ENTITY_ACTION.WILL_MOVE;
                exit;
                }
            else if EntityFindPathToCell(entity, target.cell){
                ds_list_add(will_move_list, entity);
                entity.action = ENTITY_ACTION.WILL_MOVE;
                exit;
                }
            }
        }
    
    if !ds_stack_empty(entity.path_stack){
        //move if a path exists
        ds_list_add(will_move_list, entity);
        entity.action = ENTITY_ACTION.WILL_MOVE;
        }
    else{
        EntityWander(entity);
        }
    }
