var entity = argument0;

show_debug_message("EntitySetupAttack( "+EntityGetName(entity)+" )");
ds_list_add(action_list, entity);
entity.action = ENTITY_ACTION.ATTACK;
entity.target = player;
