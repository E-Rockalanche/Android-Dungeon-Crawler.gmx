var item = argument0;

ASSERT(item != -1, "Item nonexistant in ItemgetName()");

switch(ItemCategory(item)){
    //predefined item names
    case ITEM_CATEGORY.GOLD:
        return "Gold";
        
    case ITEM_CATEGORY.FOOD:
        return "Ration";
        
    case ITEM_CATEGORY.AMMO:
        return "Arrow";
        
    case ITEM_CATEGORY.KEY:
        return "Key";
    
    //indexed item names
    case ITEM_CATEGORY.WEAPON:
        return weapon_index[ItemType(item), WEAPON_INDEX.NAME];
        
    case ITEM_CATEGORY.PROJECTILE:
        return projectile_index[ItemType(item), PROJECTILE_INDEX.NAME];
        
    case ITEM_CATEGORY.ARMOUR:
        return armour_index[ItemType(item), ARMOUR_INDEX.NAME];
        
    case ITEM_CATEGORY.RING:
        return ring_name[ItemType(item)];
        
    case ITEM_CATEGORY.WAND:
        return wand_name[ItemType(item)];
        
    case ITEM_CATEGORY.SCROLL:
        return scroll_name[ItemType(item)];
        
    case ITEM_CATEGORY.POTION:
        return potion_name[ItemType(item)];
        
    default:
        ASSERT(false, "Unknown item category in ItemGetName()");
    }
