//moves entity to a random position on the map
//not nessessarily for teleporting
var entity = argument0;

show_debug_message("EntityTeleport( "+EntityGetName(entity)+" )");

EntityRemoveFromMap(entity);
var new_i, new_j, cell;
do{
    new_i = irandom_range(1, map_width-2);
    new_j = irandom_range(1, map_height-2);
    cell = map[# new_i, new_j];
    }until(EntityPosFree(entity, new_i, new_j));
    
show_debug_message("Teleported to position ("+string(new_i)+","+string(new_j)+")");

EntitySetCell(entity, cell);
    
ds_stack_clear(entity.path_stack);
