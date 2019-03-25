var room_list = argument0;

var rand = random(100);
var index = 0;
var rm;
do{
    rm = room_list[| index];
    var fun = rm[? ROOM.FUN_PERCENT];
    if (rand >= fun){
        index = (index + 1) mod ds_list_size(room_list);
        rand -= fun;
        }
    else{
        show_debug_message("Found fun room "+string(rm));
        return rm;
        }
    }until(false);
