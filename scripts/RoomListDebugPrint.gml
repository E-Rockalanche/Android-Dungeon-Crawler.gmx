var room_list = argument0;

show_debug_message("***ROOM_LIST_DEBUG_PRINT()***");

for(var n = 0; n < ds_list_size(room_list); n++){
    show_debug_message("room_list[| "+string(n)+"] = "+string(room_list[| n]));
    }
