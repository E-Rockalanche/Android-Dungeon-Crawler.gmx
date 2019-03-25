//executed in scr_turn_start()

var entity = argument0;

if EntityHasStatusEffect(entity, STATUS.ON_FIRE){
    EntityTakeDamage(entity, 1);
    CellSetOnFire(entity.cell);
    }

if EntityHasStatusEffect(entity, STATUS.POISONED){
    EntityTakeDamage(entity, 1);
    }
