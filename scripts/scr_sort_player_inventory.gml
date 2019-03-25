show_debug_message("scr_sort_player_inventory()");

var priority_list = ds_priority_create();
var inventory = player.inventory;

while(ds_list_size(inventory) > 0){
    var item = ds_list_delete_return(inventory, 0);
    
    var priority = item_list_priority[ItemCategory(item)];
    
    if (BL(ItemCategory(item)) & ~ITEM_IS_PREDEFINED){
        priority += ItemType(item);
        }
    
    if ItemIsEquipped(item, player){
        priority += 100000;
        }
    
    ds_priority_add(priority_list, item, priority);
    }

while(ds_priority_size(priority_list)){
    ds_list_add(inventory, ds_priority_delete_max(priority_list));
    }
    
ds_priority_destroy(priority_list);
