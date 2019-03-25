var button = argument0;
var mode = argument1;

var enable = (
    (mode == INVENTORY_MODE.ALL) ||
    ((mode == INVENTORY_MODE.UNIDENTIFIED) && (!ItemIdentified(item))) ||
    ((mode == INVENTORY_MODE.ENCHANTABLE) && (BL(ItemCategory(item)) & ITEM_CAN_BE_ENCHANTED)) ||
    ((mode == INVENTORY_MODE.WEAPON) && (BL(ItemCategory(item)) == ITEM_CATEGORY.WEAPON)) ||
    ((mode == INVENTORY_MODE.ARMOUR) && (BL(ItemCategory(item)) == ITEM_CATEGORY.ARMOUR)) ||
    ((mode == INVENTORY_MODE.WAND) && (BL(ItemCategory(item)) == ITEM_CATEGORY.WAND))
    );
    
button[? BUTTON.ENABLED] = enable;
