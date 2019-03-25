//executed by obj_entity

hunger = max_hunger;

//change whn food types are introduced
/*
switch(food[? ITEM.TYPE]){
    }
*/

ItemDestroy(InventoryDeplete(inventory, action_item, 1));
turn_timer = 1;
scr_action_end();
