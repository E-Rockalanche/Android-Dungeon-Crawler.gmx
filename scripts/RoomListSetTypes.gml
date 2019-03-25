var room_list = argument0;

show_debug_message("--- RoomListSetTypes() ---");

for(var n = 0; n < ds_list_size(room_list); n++){
    var rm = room_list[| n];
    
    rm_width = rm[? ROOM.WIDTH];
    rm_height = rm[? ROOM.HEIGHT];
    var min_size = min(rm_height, rm_width);
    var max_size = max(rm_height, rm_width);
    
    var room_type = ROOM_TYPE.SQUARE;
    if (Chance(25) && (min_size >= MIN_CIRCLE_SIZE)){
        room_type = ROOM_TYPE.CIRCLE;
        }
    else if (min_size >= MIN_CAVE_SIZE){
        if Chance(100 - 50*(max_size <= MAX_SQUARE_SIZE)){
            room_type = ROOM_TYPE.CAVE;
            }
        }
    switch(room_type){
        case ROOM_TYPE.SQUARE:
            RoomMakeSquare(rm);
            break;
        case ROOM_TYPE.CAVE:
            RoomMakeCave(rm);
            break;
        case ROOM_TYPE.CIRCLE:
            RoomMakeCircle(rm);
            break;
        }
    }
