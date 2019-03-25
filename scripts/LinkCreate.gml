var room1 = argument0;
var room2 = argument1;

ds_list_add(room1[? ROOM.LINKS], room2);
ds_list_add(room2[? ROOM.LINKS], room1);

var link = ds_map_create();
link[? 0] = room1;
link[? 1] = room2;

return link;
