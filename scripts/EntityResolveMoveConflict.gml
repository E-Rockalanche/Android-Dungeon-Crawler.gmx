var entity1 = argument0;
if (ds_stack_size(entity1.path_stack) > 0){
    var cell1 = ds_stack_top(entity1.path_stack);
    
    if (entity1.size == 1){
        var entity2 = cell1.entity;
        if (entity2 != -1){
            if (entity2.action = ENTITY_ACTION.WILL_MOVE){
                var cell2 = ds_stack_top(entity2.path_stack);
                if (cell2 != entity1.cell){
                    if (ds_list_exists(will_move_list, entity2)){
                        //must be added to move_list after entity 2
                        ds_list_add_after(will_move_list, entity1, entity2)
                        exit;
                        }
                    else{
                        //ok to move
                        EntityMove(entity1);
                        ds_list_add(moving_list, entity1);
                        exit;
                        }
                    }
                else{
                    show_debug_message(EntityGetName(entity1)+" and "+EntityGetName(entity2)+" are trying to move into eachother");
                    entity1.action = ENTITY_ACTION.WAIT;
                    entity2.action = ENTITY_ACTION.WAIT;
                    ds_list_delete_value(will_move_list, entity2);
                    exit;
                    }
                }
            else{
                show_debug_message(EntityGetName(entity1)+" is trying to move into a stationary entity");
                entity1.action = ENTITY_ACTION.WAIT;
                exit;
                }
            }
        else{
            //ok to move
            EntityMove(entity1);
            ds_list_add(moving_list, entity1);
            exit;
            }
        }
    else{
        //entity of size greater than 1
        
        var size = entity1.size;
        show_debug_message(EntityGetName(entity1)+" has size: "+string(size));
        var new_i = cell1.i;
        var new_j = cell1.j;
        var max_index = -1;
        for(var i = new_i; i < new_i + size; i++){
            for(var j = new_j; j < new_j + size; j++){
                var cur_cell = map[# i,j];
                var entity2 = cur_cell.entity;
                if (entity2 != -1){
                    if (entity2 == entity1){
                        //already occupying this cell
                        continue;
                        }
                    if (entity2.action == ENTITY_ACTION.WILL_MOVE){
                        var cell2 = ds_stack_top(entity2.path_stack);
                        if !PosInBox(cell2.i, cell2.j, new_i, new_j, size, size){
                            //entity2 is moving out of way of entity1
                            max_index = max(max_index, ds_list_find_index(will_move_list, entity2));
                            }
                        else{
                            //entity2 is moving in the path of entity1
                            show_debug_message(EntityGetName(entity1)+" is blocked by a moving entity");
                            entity1.action = ENTITY_ACTION.WAIT;
                            exit;
                            }
                        }
                    else{
                        //trying to move into stationary entity
                        show_debug_message(EntityGetName(entity1)+" is trying to move into a stationary entity");
                        entity1.action = ENTITY_ACTION.WAIT;
                        exit;
                        }
                    }
                else{
                    //ok to move
                    }
                }
            }
        if (max_index > -1){
            ds_list_insert(will_move_list, max_index + 1, entity1);
            exit;
            }
        else{
            //ok to move
            EntityMove(entity1);
            ds_list_add(moving_list, entity1);
            exit;
            }
        }
    }
else{
    //no path
    show_debug_message(EntityGetName(entity1)+" has no path constructed");
    entity1.action = ENTITY_ACTION.WAIT;
    exit;
    }
