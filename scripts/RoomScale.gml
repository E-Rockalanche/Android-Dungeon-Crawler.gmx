var rm = argument0;
var scale = argument1;
var min_size = argument2;

ASSERT(scale <= 1, "trying to scale room larger than original size in RoomScale(), scale = "+string(scale));

var old_width = rm[? ROOM.WIDTH];
var old_height = rm[? ROOM.HEIGHT];

var new_width = max(min_size, round(old_width*scale));
var new_height = max(min_size, round(old_height*scale));

rm[? ROOM.WIDTH] = new_width;
rm[? ROOM.HEIGHT] = new_height;

rm[? ROOM.LEFT] += irandom(old_width-new_width);
rm[? ROOM.TOP] += irandom(old_height-new_height);
