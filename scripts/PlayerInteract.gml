show_debug_message("PlayerInteract()");

switch(interaction_type){
    case PLAYER_INTERACTION.ENTITY:
        var entity = interaction_object;
        if (entity == player){
            //wait
            player.action = ENTITY_ACTION.WAIT;
            game_state = GAME_STATE.AI_TURN;
            return true;
            }
        else if EntityIsEnemy(entity){
            //enemy
            if EntityCanAttackTarget(player, entity){
                EntityAttack(player, entity);
                return true;
                }
            }
        else if (EntityDistance(player, entity) == 1){
            if DiagFree(player.cell, entity.cell){
                //talk to NPC
                }
            }
        break;
    
    case PLAYER_INTERACTION.ITEM:
        if (player.cell == interaction_cell){
            EntityPickUp(player)
            }
        break;
    
    case PLAYER_INTERACTION.OBJECT:
        if (player.cell == interaction_cell){
            //interact with object
            }
        break;
    
    case PLAYER_INTERACTION.CELL:
        switch(interaction_cell.tile){
            case TILE.STAIRS_UP:
            case TILE.STAIRS_DOWN:
                if (player.cell == interaction_cell){
                    if (CellHasStairs(interaction_cell)){
                        PlayerUseStairs();
                        return true;
                        }
                    }
                break;
            
            case TILE.DOOR_LOCKED:
                if ((CellDistance(player.cell, interaction_cell) == 1) && DiagFree(player.cell, interaction_cell)){
                    if PlayerUseKey(){
                        CellSetTile(interaction_cell, TILE.DOOR_CLOSED);
                        audio_play_sound(snd_unlock, 0, false);
                        return true;
                        }
                    }
                break;
                
            case TILE.DOOR_HIDDEN:
                return false;
                break;
                
            default:
                //regular terrain
                return (player.cell == interaction_cell);
                break;
            }
        
        break;
        
    default:
        ASSERT(false, "Unknown interaction type in PlayerInteract()");
    }
    
show_debug_message("Interaction failed");
return false;//did not interact. Player will continue to automove
