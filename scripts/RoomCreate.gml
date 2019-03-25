var rm = ds_map_create();
rm[? ROOM.LEFT] = argument0;
rm[? ROOM.TOP] = argument1;
rm[? ROOM.WIDTH] = argument2;
rm[? ROOM.HEIGHT] = argument3;

show_debug_message("Created room "+string(rm)+", ("+string(argument0)+", "+string(argument1)+", "+string(argument0+argument2)+", "+string(argument1+argument3)+")");

rm[? ROOM.TREASURE_ROOM] = false;
rm[? ROOM.TYPE] = -1;
rm[? ROOM.DOORS] = ds_list_create();
rm[? ROOM.LINKS] = ds_list_create();
rm[? ROOM.TREE] = -1;

return rm;
