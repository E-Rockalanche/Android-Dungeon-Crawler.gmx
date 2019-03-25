var item = argument0;
var i = argument1;
var j = argument2;

draw_set_colour_write_enable(true, true, true, false);

draw_sprite(ItemSprite(item), ItemIndex(item), (i + 0.5)*GRID_SIZE, (j + 0.5)*GRID_SIZE);

draw_set_colour_write_enable(true, true, true, true);
