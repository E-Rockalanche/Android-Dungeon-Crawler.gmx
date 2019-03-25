var entity = argument0;

if EntityHasStatusEffect(entity, STATUS.ON_FIRE){
    EntityStopStatusEffect(entity, STATUS.ON_FIRE);
    }
else{
    entity.status_effect[STATUS.FROZEN] = 3;
    ds_list_delete_value(decide_list, entity);
    }
