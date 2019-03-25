switch((player.cell).tile){
    case TILE.STAIRS_DOWN:
        //proceed to next floor
        if (entity == player){
            if (ds_stack_size(player.path_stack) == 0){
                GoToDepth(player_depth+1);
                }
            }
        break;
    
    case TILE.STAIRS_UP:
        //proceed to previous floor
        if (entity == player){
            if (ds_stack_size(player.path_stack) == 0){
                if (player_depth > 1){
                    GoToDepth(player_depth-1);
                    }
                else{
                    show_debug_message("You leave the dungeon with the treasures you collected");
                    scr_destroy_data();
                    game_end();
                    }
                }
            }
        break;
    
    default:
        ASSERT(false, "Player tryin to use stairs on non-stair tile");
    }
