var entity = argument0;

if !entity.in_view{
    if (ds_stack_size(entity.path_stack) == 0){
        entity.turn_timer = player.turn_timer;
        exit;
        }
    }
    
else{
    entity.turn_timer = 1;
    }
