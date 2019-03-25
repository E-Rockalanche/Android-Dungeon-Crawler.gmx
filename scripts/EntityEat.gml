var entity = argument0;
var food = argument1;

entity.action = ENTITY_ACTION.EAT;
entity.action_item = food;
entity.action_alarm = 15;
EntitySetSpriteUse(entity);
scr_action_start();
