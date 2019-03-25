var room_list = argument0;
var room1 = argument1;
var i = argument2;
var j = argument3;

var rm_left1 = room1[? ROOM.LEFT] + i;
var rm_top1 = room1[? ROOM.TOP] + j;
var rm_width1 = room1[? ROOM.WIDTH];
var rm_height1 = room1[? ROOM.HEIGHT];

if ((rm_left1 < 0) || (rm_top1 < 0) || ((rm_left1 + rm_width1) > width) || ((rm_top1 + rm_height1) > height)){
    return false;
    }

for(var n = 0; n < ds_list_size(room_list); n++){
    var room2 = room_list[| n];
    if (room1 != room2){
        var rm_left2 = room2[? ROOM.LEFT];
        var rm_top2 = room2[? ROOM.TOP];
        var rm_width2 = room2[? ROOM.WIDTH];
        var rm_height2 = room2[? ROOM.HEIGHT];
        if ((rm_left1 + rm_width1 >= rm_left2) && (rm_top1 + rm_height1 >= rm_top2) &&
            (rm_left2 + rm_width2 >= rm_left1) && (rm_top2 + rm_height2 >= rm_top1)){
            return false;
            }
        }
    }
    
return true;
