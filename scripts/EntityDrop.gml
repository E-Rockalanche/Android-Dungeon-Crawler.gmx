var entity = argument[0];
var item = argument[1];

ASSERT(item != -1, "No item in EntityDropItem()");

entity.action_alarm = 1;
entity.action = ENTITY_ACTION.DROP;
entity.action_item = item;
scr_action_start();
