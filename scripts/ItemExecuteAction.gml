with(obj_game){
    var item = argument0;
    var action = argument1;
    
    switch(action){
        case ITEM_ACTION.THROW:
            throw_item = item;
            game_state = GAME_STATE.THROW_ITEM;
            break;
            
        case ITEM_ACTION.ZAP:
            if (WandCharges(item) > 0){
                use_wand = item;
                game_state = GAME_STATE.USE_WAND;
                }
            break;
            
        case ITEM_ACTION.DROP:
            EntityDrop(player, item);
            break;
            
        case ITEM_ACTION.USE:
            EntityUseItem(player, item);
            break;
            
        case ITEM_ACTION.EQUIP:
            EntityEquip(player, item);
            break;
            
        case ITEM_ACTION.UNEQUIP:
            EntityUnequip(player, item);
            break;
            
        default:
            ASSERT(false, "Item action not in ItemExecuteAction()");
        }
    }
