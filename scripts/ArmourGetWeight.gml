var armour = argument0

ASSERT(ItemCategory(armour) == ITEM_CATEGORY.ARMOUR, ItemGetName(armour)+" is not armour");

return armour_index[ItemType(armour), ARMOUR_INDEX.WEIGHT];
