var entity = argument0;
var wand = argument1;
var destination = argument2;

if (WandCharges(wand) > 0){
    entity.action = ENTITY_ACTION.ZAP_WAND;
    entity.action_item = wand;
    entity.action_cell = destination;
    
    EntitySetSpriteAttack(entity);
    EntitySetActionAlarm(entity);
    return true;
    }
else{
    return false;
    }
