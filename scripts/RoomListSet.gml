var room_list = argument0;

show_debug_message("--- RoomListSet() ---");

for(var n = 0; n < ds_list_size(room_list); n++){
    var rm = room_list[| n];
    RoomSet(rm);
    }
