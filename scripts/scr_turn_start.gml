//executed by obj_game

//do{
    show_debug_message("----------------------------- scr_turn_start() -----------------------------");
    
    var turn_timer = GetMinTurnTimer();
    player_turn = false;
    
    show_debug_message("all timers -= "+string(turn_timer));
    
    //find enemies deciding this turn
    game_state = GAME_STATE.AI_TURN;//the player's turn will override this
    
    //check if it is the map's turn
    //will do map turn after entity turns
    var map_turn = false;
    map_turn_timer -= turn_timer;
    if (map_turn_timer <= 0){
        map_turn = true;
        map_turn_timer = 1;
        }
    
    ds_list_clear(decide_list);
    for(var n = 0; n < ds_list_size(entity_list); ++n){
        var entity = entity_list[| n];
        
        ASSERT(entity != -1, "Unexistant entity in entity_list. n = "+string(n));
        
        EntityBreathGas(entity);
        
        if map_turn{
            EntityStatusEffects(entity);
            EntityReduceStatusEffects(entity);
            }
        
        switch(entity.state){
            case ENTITY_STATE.DORMANT:
            case ENTITY_STATE.SLEEPING:
            case ENTITY_STATE.UNACTIVATED:
                continue;
            case ENTITY_STATE.DEAD:
                //entity died from a status effect right now. It has already been removed from the list
                n--;
                continue;
            }
        
        entity.turn_timer -= turn_timer;
        
        if (entity.turn_timer <= 0){
            entity.turn_timer = 0;
            //only active entities have this action
            //entity's turn
            
            entity.action = ENTITY_ACTION.UNDECIDED;
            
            EntityStatusEffectsOnTurn(entity);
            
            if (entity.action == ENTITY_ACTION.UNDECIDED){
                //if status effect did not affect the entity;s decision
                if (entity == player){
                    game_state = GAME_STATE.PLAYER_TURN;
                    show_debug_message("----------------------------- game_state = PLAYER_TURN -----------------------------");
                    }
                else {
                    ds_list_add(decide_list, entity);
                    EntityNoticePlayer(entity);
                    }
                }
            }
        //else action stays the same. used to keep track of entity's last action
        }
        
    var list_size = ds_list_size(decide_list) + ds_list_size(moving_list);
    show_debug_message("list size = "+string(list_size));
    
    if map_turn{
        scr_map_turn();
        }
    else if ((list_size == 0) && (game_state != GAME_STATE.PLAYER_TURN)){//nothing happened!
        ASSERT(false, "ERROR: Nothing will happen this turn");
        game_state = GAME_STATE.ERROR;
        }
    
//    }until((game_state == GAME_STATE.PLAYER_TURN) || (list_size > 0));//<-- stops stutter when player walks at half speed
