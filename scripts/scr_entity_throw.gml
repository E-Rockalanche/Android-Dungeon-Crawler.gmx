//executed by obj_entity

EntityUnequip(id, action_item);

var item = InventoryDeplete(inventory, action_item, 1);
var cell = action_cell;

//turns off animation
scr_action_end();

//turns on animation
with(obj_game){
    BoltCreate(other, cell, BOLT.ITEM, item);
    }
