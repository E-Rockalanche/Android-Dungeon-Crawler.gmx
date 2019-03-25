/*
x = argument0
y = argument1
text = argument2
colour = argument3
*/

show_debug_message("Creating splash");

with(instance_create(argument0, argument1, obj_splash)){
    text = argument2;
    colour = argument3;
    vspeed = -GRID_SIZE/60;
    alpha_step = -1/60;
    alarm[0] = 60;
    }
