var mouse = argument0;
var mx = device_mouse_x(mouse);
var my = device_mouse_y(mouse);

var left = argument1;
var top = argument2;

return ((mx >= left) && (my >= top) && (mx < (left+argument3)) && (my < (top+argument4)));
