var rm = argument0;
var amount = argument1;
var min_size = argument2;

ASSERT(amount >= 0, "trying to increase size of room in RoomShrink(), amount = "+string(amount));

var old_width = rm[? ROOM.WIDTH];
var old_height = rm[? ROOM.HEIGHT];

var new_width = max(min_size, old_width - amount);
var new_height = max(min_size, old_height - amount);

rm[? ROOM.WIDTH] = new_width;
rm[? ROOM.HEIGHT] = new_height;

rm[? ROOM.LEFT] += irandom(old_width - new_width);
rm[? ROOM.TOP] += irandom(old_height - new_height);
