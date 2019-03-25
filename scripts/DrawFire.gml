var i = argument0;
var j = argument1;

draw_sprite(spr_fire, (step div 4) mod sprite_get_number(spr_fire), (i + 0.5)*GRID_SIZE, (j + 0.5)*GRID_SIZE);
