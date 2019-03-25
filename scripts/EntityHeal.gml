var entity = argument0;
var amount = argument1;

entity.hp = min(entity.hp + amount, entity.max_hp);

SplashText(entity.draw_x, entity.draw_y, amount, c_green);
