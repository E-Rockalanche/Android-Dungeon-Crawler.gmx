//executed in scr_turn_start()

var entity = argument0;

if (EntityHasStatusEffect(entity, STATUS.FROZEN)
    || EntityHasStatusEffect(entity, STATUS.PARALYZED)
    || EntityHasStatusEffect(entity, STATUS.SLEEPING))
    {
    show_debug_message(EntityGetName(entity)+" is frozen/paralyzed/sleeping");
    entity.action = ENTITY_ACTION.WAIT;
    exit;
    }

if EntityHasStatusEffect(entity, STATUS.CONFUSED){
    show_debug_message(EntityGetName(entity)+" is confused");
    if !EntityMoveRandom(entity){
        entity.action = ENTITY_ACTION.WAIT;
        }
    exit;
    }
