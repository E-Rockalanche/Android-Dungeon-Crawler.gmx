var entity = argument0;
var item = argument1;
var destination = argument2;

entity.action = ENTITY_ACTION.THROW;
entity.action_item = item;
entity.action_cell = destination;
scr_action_start();
EntitySetSpriteAttack(entity);
EntitySetActionAlarm(entity);
