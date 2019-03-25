var rm = argument0;

var left = rm[? ROOM.LEFT]*GRID_SIZE;
var top = rm[? ROOM.TOP]*GRID_SIZE;
var width = rm[? ROOM.WIDTH]*GRID_SIZE;
var height = rm[? ROOM.HEIGHT]*GRID_SIZE;

var outline = path_add();

path_add_point(outline, left, top, 1);
path_add_point(outline, left+width, top, 1);
path_add_point(outline, left+width, top+height, 1);
path_add_point(outline, left, top+height, 1);

path_set_closed(outline, true);

return outline;
