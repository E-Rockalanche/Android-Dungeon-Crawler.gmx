var entity = argument0;

if EntityHasStatusEffect(entity, STATUS.FROZEN){
    EntityStopStatusEffect(entity, STATUS.FROZEN);
    }
else{
    entity.status[STATUS.ON_FIRE] = 10;
    }
