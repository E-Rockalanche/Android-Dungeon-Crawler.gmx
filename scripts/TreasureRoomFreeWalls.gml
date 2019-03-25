var rm = argument0;

var left = rm[? ROOM.LEFT];
var top = rm[? ROOM.TOP];
var right = left + rm[? ROOM.WIDTH];
var bottom = top + rm[? ROOM.HEIGHT];

for(var i = max(1, left); i < min(right, width-1); i++){
    for(var j = max(1, top); j < min(bottom, height-1); j++){
        var cell = map[# i,j];
        if (cell.is_room_border){
            cell.permanent = false;
            }
        }
    }
