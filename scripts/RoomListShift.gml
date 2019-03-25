//shifts rooms around to look less "BSP-like"

var room_list = argument0;

show_debug_message("--- RoomListResize() --");
for(var n = 0; n < ds_list_size(room_list); n++){
    var rm = room_list[| n];
    var best_dir = 0;
    var max_dist = 0;
    for(var d = 0; d < 8; d += 2){
        var dist = 0;
        var i = rm[? ROOM.LEFT];
        var j = rm[? ROOM.TOP];
        var ok;
        do{
            i += dirs[d,0];
            j += dirs[d,1];
            ok = RoomFree(room_list, rm, i, j);
            dist += ok;
            }until(!ok);
        if (dist > max_dist){
            max_dist = dist;
            best_dir = d;
            }
        }
    
    //shift into available space
    x_shift = irandom(max_dist)*dirs[best_dir, 0];
    y_shift = irandom(max_dist)*dirs[best_dir, 1];
    RoomShift(rm, x_shift, y_shift);
    }
