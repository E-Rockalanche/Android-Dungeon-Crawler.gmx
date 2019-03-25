//executed by obj_entity

ASSERT(action_item != -1, "no wand in scr_entity_zap()");
ASSERT(action_cell != -1, "no cell in scr_entity_zap()");

var item = action_item;
var cell = action_cell;
    
item.charges--;

//turn off animation
scr_action_end();

//turns on animation
with(obj_game){
    BoltCreate(other, cell, BOLT.WAND, item);
    }
