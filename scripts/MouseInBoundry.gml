var mouse = argument0;
var mx = device_mouse_x(mouse);
var my = device_mouse_y(mouse);

return ((mx >= argument1) && (my >= argument2) && (mx < argument3) && (my < argument4));
