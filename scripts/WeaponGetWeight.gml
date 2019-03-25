var weapon = argument0;

ASSERT(ItemCategory(weapon) == ITEM_CATEGORY.WEAPON, "Item in WeaponGetWeight() is not a weapon");

return weapon_index[ItemType(weapon), WEAPON_INDEX.WEIGHT];
