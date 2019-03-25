//splits stack of item and returns amount of copy
//does not destroy original item if quantity reaches zero

var item = argument0;
var amount_to_return = argument1;

ASSERT(item != -1, "Item does not exist in ItemSplitStack()");

var quantity = ItemQuantity(item);

ASSERT((amount_to_return <= quantity) && (amount_to_return > 0), "Cannot return "+string(amount_to_return)+" from "+string(quantity)+" by ");

var copy = ItemCopy(item);
item.quantity -= amount_to_return;
copy.quantity = amount_to_return;

return copy;

//should check for quantity of 0 of original item after splitting
