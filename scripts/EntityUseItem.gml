//used by player

var entity = argument0;
var item = argument1;

switch(ItemCategory(item)){
    case ITEM_CATEGORY.POTION:
        EntityDrink(entity, item);
        break;
    
    case ITEM_CATEGORY.SCROLL:
        EntityRead(entity, item);
        break;
        
    case ITEM_CATEGORY.FOOD:
        EntityEat(entity, item);
        break;
    
    default:
        ASSERT(false, "unknown item category in EntityUseItem()");
        //wands must be zapped, not used
    }
