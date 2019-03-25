var item = argument0;

return true;

/*
if (BL(item[? ITEM.CATEGORY]) & ITEM_IS_IDENTIFIABLE){
    //if (BL(item[? ITEM.CATEGORY]) & ITEM_IS_EQUIPABLE){
    switch(item[? ITEM.CATEGORY]){
        case ITEM_CATEGORY.WEAPON:
        case ITEM_CATEGORY.ARMOUR:
        case ITEM_CATEGORY.WAND:
            return (item[? ITEM.STEPS_TO_IDENTIFY] == 0);
            break;
        
        case ITEM_CATEGORY.POTION:
            break;
        case ITEM_CATEGORY.SCROLL:
            break;
        }
    }

return true;
