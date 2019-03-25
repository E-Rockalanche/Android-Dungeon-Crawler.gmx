var weapon = argument0;

var min_damage, max_damage, type;

switch(ItemCategory(weapon)){
    case ITEM_CATEGORY.WEAPON:
        type = ItemType(weapon);
        min_damage = weapon_index[type, WEAPON_INDEX.MIN_DAMAGE];
        max_damage = weapon_index[type, WEAPON_INDEX.MAX_DAMAGE];
        break;
        
    case ITEM_CATEGORY.PROJECTILE:
        type = ItemType(weapon);
        min_damage = projectile_index[type, PROJECTILE_INDEX.MIN_DAMAGE];
        max_damage = projectile_index[type, PROJECTILE_INDEX.MAX_DAMAGE];
        break;
        
    //wand?
    
    default://non weapon
        min_damage = 0;
        max_damage = 2;
        break;
    }

return irandom_range(min_damage, max_damage);
