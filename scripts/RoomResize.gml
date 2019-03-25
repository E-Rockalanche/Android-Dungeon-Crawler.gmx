var rm = argument0;
var new_width = argument1;
var new_height = argument2;

var old_width = rm[? ROOM.WIDTH];
var old_height = rm[? ROOM.HEIGHT];

rm[? ROOM.WIDTH] = new_width;
rm[? ROOM.HEIGHT] = new_height;

rm[? ROOM.LEFT] += irandom(max(0, old_width - new_width));
rm[? ROOM.TOP] += irandom(max(0, old_height - new_height));
