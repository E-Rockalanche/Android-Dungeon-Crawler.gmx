var cell = argument0;
var item = argument1;

ASSERT((item != -1),"nonexistant item in InventoryAdd()");

if (argument_count > 2){
    item.quantity = argument[2];
    }

var items = cell.items;

if (ds_list_size(items) == 0){
    //cell does not have any items
    ds_list_add(item_list, cell);
    ds_list_add(items, item);
    exit;
    }

if (BL(ItemCategory(item)) & ITEM_CAN_STACK){
    show_debug_message("Trying to Stack "+ItemGetName(item));
    for(var n = 0; n < ds_list_size(items); n++){
        var cur_item = items[| n];
        if ItemsAreSame(cur_item, item){
            ItemsMerge(cur_item, item);
            //put newly merged item into front of list
            ds_list_delete(items, n);
            ds_list_insert(items, 0, cur_item);
            exit;
            }
        }
    }

//if item is not already on the ground
ds_list_add(items, item);
