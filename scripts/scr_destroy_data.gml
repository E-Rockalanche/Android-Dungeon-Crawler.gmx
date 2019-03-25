show_debug_message("----------------------------- scr_destroy_data() -----------------------------");

for(var n = 0; n < dungeon_size; n++){
    FloorDestroy(floors[n]);
    }

ds_list_destroy(decide_list);
ds_list_destroy(log_list);
ds_list_destroy(moving_list);
ds_list_destroy(will_move_list);
ds_list_destroy(action_list);
ds_list_destroy(view_list);

scr_destroy_animated_tiles();
    
instance_destroy();
