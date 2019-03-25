var entity = argument0;

show_debug_message("EntityDie( "+EntityGetName(entity)+" )");

entity.hp = 0;

//drop inventory
var inventory = entity.inventory;
while(ds_list_size(inventory) > 0){
    var item = ds_list_delete_return(inventory, 0);
    CellAddItem(entity.cell, item);
    }

entity.state = ENTITY_STATE.DEAD;
EntityRemoveFromMap(entity);

//remove entity from any lists it might be on
ds_list_delete_value(entity_list, entity);
ds_list_delete_value(decide_list, entity);
ds_list_delete_value(action_list, entity);

EntitySetSpriteDie(entity);
entity.death_alarm = sprite_get_number(entity.sprite_index)/entity.image_speed;

instance_activate_object(entity);
