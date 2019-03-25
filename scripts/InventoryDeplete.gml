var inventory = argument[0];
var item = argument[1];//this item is in the inventory

ASSERT((item != -1),"nonexistant item in InventoryAdd()");

var amount;
if (argument_count > 2){
    amount = argument[2];
    }
else{
    amount = ItemQuantity(item);
    }
    
ASSERT(amount > 0, "trying to throw away 0 or less of "+ItemGetName(item));

show_debug_message("InventoryDeplete( "+string(ItemGetName(item))+", "+string(amount)+")");

var copy = ItemSplitStack(item, amount);
if (ItemQuantity(item) == 0){
    show_debug_message("No more "+string(ItemGetName(item))+" in inventory");
    ds_list_delete_value(inventory, item);
    ItemDestroy(item);
    }
else{
    show_debug_message(string(ItemQuantity(item))+" "+string(ItemGetName(item))+"(s) remaining in inventory");
    }
    
return copy;
