show_debug_message("----------------------------- scr_ai_turn() -----------------------------");
//game_state can only be AI_TURN

var time = current_time;
    
while(ds_list_size(decide_list) > 0){
    EntityDecide(ds_list_delete_return(decide_list,0));
    //EntityPerformGoal(ds_list_delete_return(decide_list,0));
    }
    
if (ds_list_size(will_move_list) > 0){
    //try to move entities
    scr_ai_move();
    }
    
show_debug_message("AI and pathfinding took "+string(current_time - time)+"milliseconds");

if (ds_list_size(moving_list) > 0){
    //if decided to move, the player will be in the moving_list
    game_state = GAME_STATE.ENTITY_MOVING;
    game_state_alarm = MOVE_TIME;
    
    scr_player_check_for_neighboring_enemies();
    }
else if (ds_list_size(action_list) > 0){
    EntityAction(ds_list_delete_return(action_list, 0));
    }
else{
    game_state = GAME_STATE.TURN_START;
    }
