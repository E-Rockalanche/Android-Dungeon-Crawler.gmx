var entity = argument0;
var potion = argument1;

show_debug_message("EntityDrink( "+EntityGetName(entity)+", "+ItemGetName(potion)+" )");

entity.action = ENTITY_ACTION.DRINK;
entity.action_alarm = 15;
entity.action_item = potion;
EntitySetSpriteUse(entity);
scr_action_start();
