var i = argument0;
var j = argument1;

var left = (i mod 2)*GRID_SIZE;
var top = (j mod 2)*GRID_SIZE;

draw_sprite_part(spr_new_water, 0, left, top, GRID_SIZE, GRID_SIZE, i*GRID_SIZE, j*GRID_SIZE);


/*
var left = (i mod 2)*GRID_SIZE + 32*(alpha != 1);
var top = (j mod 2)*GRID_SIZE;

var offset = (step/8) mod 32;

draw_sprite_part_ext(spr_new_water, (alpha == 1), left + offset*(1 - 2*(alpha != 1)), top+32 - offset, GRID_SIZE, GRID_SIZE, i*GRID_SIZE, j*GRID_SIZE, 1, 1, c_white, alpha);
