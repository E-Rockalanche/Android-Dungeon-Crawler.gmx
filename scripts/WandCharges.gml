var w = argument0;
ASSERT(ItemCategory(w) == ITEM_CATEGORY.WAND, "***ERROR: getting charges from non-wand "+ItemGetName(w));
return w.charges;
