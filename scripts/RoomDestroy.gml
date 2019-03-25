var rm = argument0;

ds_list_destroy(rm[? ROOM.DOORS]);
//ds_list_destroy(rm[? ROOM.LINKS]);

ds_map_destroy(rm);
