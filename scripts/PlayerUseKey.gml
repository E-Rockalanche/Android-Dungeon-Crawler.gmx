var inventory = player.inventory;
for(var n = 0; n < ds_list_size(inventory); n++){
    var item = inventory[| n];
    if (ItemCategory(item) == ITEM_CATEGORY.KEY_RING){
        inventory = item.inventory;
        n = 0;
        }
    else if (ItemCategory(item) == ITEM_CATEGORY.KEY){
        if (item.depth_found == player_depth){
            ItemDestroy(InventoryDeplete(inventory, item));
            return true;
            }
        }
    }
return false;
