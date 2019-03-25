var inventory = argument[0];
var item = argument[1];

ASSERT((item != -1),"nonexistant item in InventoryAdd()");

var inv_is_full = (ds_list_size(inventory) == PLAYER_INVENTORY_CAPACITY);

//assume quantity is 1
    
var category = ItemCategory(item);
var stackable = (BL(category) & ITEM_CAN_STACK);
    
for(var n = 0; n < ds_list_size(inventory); n++){
    var cur_item = inventory[| n];
    
    //items are the same
    if stackable{
        if ItemsAreSame(item, cur_item){
            return true;
            }
        else{
            show_debug_message("Items "+ItemGetName(item)+" and "+ItemGetName(cur_item)+" are not the same");
            }
        }
    
    //item has more priority. ex) weapon > armour
    if (item_list_priority[category] > item_list_priority[ItemCategory(cur_item)]) && !inv_is_full{
        return true;
        }
    }

//item has the least priority and does not already exist in inventory
return !inv_is_full;
