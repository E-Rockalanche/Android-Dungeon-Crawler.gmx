show_debug_message("--- scr_ai_move ---");

//resolve collisions between moving entities

var it = 0;
while(ds_list_size(will_move_list) > 0){
    EntityResolveMoveConflict(ds_list_delete_return(will_move_list, 0));
    it++;
    ASSERT(it < 1000, "1000 iterations of entity movement conflict resolution. PROBABLE INFINITE LOOP");
    }
