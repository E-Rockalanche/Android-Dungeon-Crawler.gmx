//executed by obj_entity

var category = ItemCategory(action_item);

if (BL(category) & ITEM_CAN_BE_EQUIPPED){
    switch(category){
        case ITEM_CATEGORY.WEAPON:
            weapon = action_item;
            break;
        
        case ITEM_CATEGORY.ARMOUR:
            armour = action_item;
            break;
        
        case ITEM_CATEGORY.RING:
            if (ring1 == -1){
                ring1 = action_item;
                }
            else{
                ring2 = action_item;
                }
            break;
        
        //case ITEM_CATEGORY.WAND:
        //    break;
        }
    }
    
scr_action_end();
