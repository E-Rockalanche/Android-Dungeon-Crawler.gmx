//instantly kills an entity regardless of invincibility or not
//probably just for debugging purposes

var entity = argument0;

show_debug_message("Killed entity "+EntityGetName(entity));

entity.hp = 0;
entity.state = ENTITY_STATE.DEAD;
(entity.cell).entity = -1;
entity.cell = -1;

//remove entity from any lists it might be on
ds_list_delete_value(entity_list, entity);
ds_list_delete_value(decide_list, entity);
ds_list_delete_value(attack_list, entity);

EntityDestroy(entity);
