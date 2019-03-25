var room_list = argument0;

show_debug_message("--- RoomListSetFunPercent() ---");
    
var total_fun = 0;
    
//find total distance from exits and set fun value
for(var n = 0; n < ds_list_size(room_list); n++){
    var rm = room_list[| n];
    var rm_left = rm[? ROOM.LEFT] + 1;
    var rm_top = rm[? ROOM.TOP] + 1;
    var rm_right = rm_left + rm[? ROOM.WIDTH] - 1;
    var rm_bottom = rm_top + rm[? ROOM.HEIGHT] - 1;
    var count = 0;
    var total = 0;
    for(var i = rm_left; i < rm_right; i++){
        for(var j = rm_top; j < rm_bottom; j++){
            var cell = map[# i,j];
            if (BL(cell.tile) & TILE_IS_GROUND){
                count++;
                total += cell.dijkstra[DIJKSTRA.TO_START] + cell.dijkstra[DIJKSTRA.TO_EXIT]
                }
            }
        }
    var value = sqr(total/count);
    total_fun += value;
    rm[? ROOM.FUN_PERCENT] = value;
    }
    
//set fun values to percentage of fun
for(var n = 0; n < ds_list_size(room_list); n++){
    var rm = room_list[| n];
    rm[? ROOM.FUN_PERCENT] *= 100/total_fun;//values between 0 and 100
    show_debug_message("room "+string(rm)+" fun percent = "+string(rm[? ROOM.FUN_PERCENT])+"%");
    }

//sum of fun values = 100
