var entity = argument0;
var scroll = argument1;
ASSERT((entity != -1) && (scroll != -1), "Entity or scroll does not exist");

//if not blinded
entity.action = ENTITY_ACTION.READ;
entity.action_alarm = 15;
entity.action_item = scroll;
EntitySetSpriteUse(entity);
scr_action_start();
