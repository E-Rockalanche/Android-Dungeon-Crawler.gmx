//executed by obj_entity

ASSERT(action_item != -1, "No item in EntityDropItem()");

show_debug_message(EntityGetName(id)+" dropped "+ItemGetName(item));

EntityUnequip(id, item);

var copy = InventoryDeplete(inventory, item, ItemQuantity(item));

var drop_i = i+irandom(size);
var drop_j = j+irandom(size);
with(obj_game){
    CellAddItem(map[# drop_i, drop_j], copy);
    }

turn_timer = 1;
scr_action_end();
