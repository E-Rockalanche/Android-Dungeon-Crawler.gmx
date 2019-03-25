show_debug_message("--- RoomListCheck() ---");

var room_list = argument0;

for(var n = 0; n < ds_list_size(room_list); n++){
    var rm = room_list[| n];
    var rm_left = rm[? ROOM.LEFT];
    var rm_top = rm[? ROOM.TOP];
    var rm_width = rm[? ROOM.WIDTH];
    var rm_height = rm[? ROOM.HEIGHT];
    if ((rm_left < 0) || (rm_top < 0) || (rm_left+rm_width > width) || (rm_top+rm_height > height)){
        ASSERT(false, "***Room "+string(rm)+" with dims ("+string(rm_left)+","+string(rm_top)+","+string(rm_left+rm_width)+","+string(rm_top+rm_height)+") is out of map bounds: ["+string(width)+","+string(height)+"]");
        }
    }
