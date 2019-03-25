show_debug_message("scr_bolt_end()");

var i = current_cell.i;
var j = current_cell.j;
switch(bolt_type){
    case BOLT.ITEM:
        if (item != -1){
            switch(ItemCategory(item)){
                case ITEM_CATEGORY.POTION:
                    //break potion
                    with(obj_game){
                        PotionBreak(other.item, i, j);
                        }
                    break;
                    
                default:
                    //place item on ground
                    with(obj_game){
                        CellAddItem(other.current_cell, other.item);
                        }
                    break;
                }
            }
        break;
        
    case BOLT.WAND:
        switch(wand_type){
            case WAND.FIRE:
                for(var d = 0; d < 8; d++){
                    var cur_cell = map[# i+dirs[d,0], j+dirs[d,1]];
                    if cur_cell.flamable{
                        with(obj_game){
                            CellSetOnFire(cur_cell);
                            }
                        }
                    }
                break;
                
            case WAND.REGROWTH:
                for(var ii = -1; ii <= 1; ii++){
                    for(var jj = -1; jj <= 1; jj++){
                        var cur_cell = map[# i+ii, j+jj];
                        if (cur_cell.tile == TILE.FLOOR){
                            cur_cell.discovered = false;
                            cur_cell.in_view = false;
                            CellSetTile(cur_cell, choose(TILE.GRASS, TILE.TALL_GRASS));
                            }
                        else if ((cur_cell.tile == TILE.GRASS) && Chance(50)){
                            cur_cell.discovered = false;
                            cur_cell.in_view = false;
                            CellSetTile(cur_cell, TILE.TALL_GRASS);
                            }
                        }
                    }
                with(obj_game){
                    scr_update_player_view();
                    }
                break;
                
            case WAND.BLINKING:
                EntityRemoveFromMap(caster);
                with(obj_game){
                    EntitySetCell(other.caster, other.current_cell);
                    scr_update_player_view();
                    if (other.caster == player){
                        view_xview = floor(player.x - view_wview/2);
                        view_yview = floor(player.y - view_hview/2);
                        }
                    }
                break;
            }
        break;
    }
    
obj_game.game_state = GAME_STATE.AI_TURN;
instance_destroy();
