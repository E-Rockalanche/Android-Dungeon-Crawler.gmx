var min_timer = 1;//map events happen every 1(time)
for(var n = 0; n < ds_list_size(entity_list); ++n){
    var entity = entity_list[| n];
    switch(entity.state){
        case ENTITY_STATE.DORMANT:
        case ENTITY_STATE.SLEEPING:
        case ENTITY_STATE.UNACTIVATED:
        case ENTITY_STATE.DEAD://shouldn't be, but just in case
            break;
        default:
            if (entity.turn_timer > 0){
                min_timer = min(min_timer, entity.turn_timer);
                }
            break;
        }
    }
return min_timer;
