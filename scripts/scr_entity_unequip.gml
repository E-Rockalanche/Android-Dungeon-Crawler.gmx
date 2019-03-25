//executed by obj_entity

var category = action_item[? ITEM.CATEGORY];

switch(category){
    case ITEM_CATEGORY.WEAPON:
        weapon = -1;
        break;
    
    case ITEM_CATEGORY.ARMOUR:
        armour = -1;
        break;
    
    case ITEM_CATEGORY.RING:
        if (ring1 == action_item){
            ring1 = -1;
            }
        else{
            ring2 = -1;
            }
        break;
    
    //case ITEM_CATEGORY.WAND:
    //    break;
    }
    
scr_action_end();
