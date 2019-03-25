var cell = ds_stack_top(player.path_stack);

ASSERT(cell != -1, "Cell == -1 in scr_player_move()");

if EntityPosFree(player, cell.i, cell.j){
    EntityMove(player);
    update_player_view = true;
    ds_list_add(moving_list, player);

    //alarm[VIEW_ALARM] = MOVE_TIME/2;
    
    for(var d = 0; d < 8; d++){
        SearchCell(map[# player.i+dirs[d,0], player.j+dirs[d,1]]);
        }
    
    scr_player_end_turn();
    }
else{
    show_debug_message("Player could not move. Automove set to false");
    player_automove = false;
    }
