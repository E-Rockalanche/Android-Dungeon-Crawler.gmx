var item = argument0;
var action = argument1;

var category = ItemCategory(item);
var flag = BL(category);

switch(action){
    case ITEM_ACTION.USE:
        return (flag & ITEM_CAN_BE_USED);
    
    case ITEM_ACTION.EQUIP:
        return ((flag & ITEM_CAN_BE_EQUIPPED) && !ItemIsEquipped(item, obj_game.player));
    
    case ITEM_ACTION.UNEQUIP:
        return ((flag & ITEM_CAN_BE_EQUIPPED) && ItemIsEquipped(item, obj_game.player));
        
    case ITEM_ACTION.ZAP:
        if (category == ITEM_CATEGORY.WAND){
            return (WandCharges(item) > 0);
            }
        return false;
        
    default:
        //drop, throw
        return true;
    }
