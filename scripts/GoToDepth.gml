//remove from map
EntityRemoveFromMap(player);

//remove rom lists
ds_list_delete_value(entity_list, entity);
ds_list_delete_value(decide_list, entity);
ds_list_delete_value(action_list, entity);

//deactivate last floors entities
scr_deactivate_entities();

//reset view and map tiles
scr_reset_view();
scr_reset_tiles();

//load or generate new floor
FloorSetCurrent(floors[argument0 - 1]);

//activate new entities
scr_activate_entities();

//set camera
view_xview = player.draw_x - view_wview/2;
view_yview = player.draw_y - view_hview/2;
