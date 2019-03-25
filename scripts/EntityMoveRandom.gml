var entity = argument0;

show_debug_message("EntityMoveRandom("+EntityGetName(entity)+")");

var i = entity.i;
var j = entity.j;

var options = ds_list_create();
for(var d = 0; d < 8; d++){
    var ii = i+dirs[d,0];
    var jj = j+dirs[d,1]
    var cell = map[# ii,jj];
    if (EntityPosFree(entity, ii, jj) && EntityDiagFree(entity, entity.cell, cell)){
        ds_list_add(options, cell);
        }
    }

if (ds_list_size(options) == 0){
    ds_list_destroy(options);
    return false;
    }

var to_cell = ds_list_get_random(options);
ds_list_destroy(options);

ds_stack_clear(entity.path_stack);
ds_stack_push(entity.path_stack, to_cell);

if (entity == player){
    scr_player_move();
    }
else{
    ds_list_add(will_move_list, entity);
    entity.action = ENTITY_ACTION.WILL_MOVE;
    }

return true;
