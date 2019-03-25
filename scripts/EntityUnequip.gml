//execyted by obj_game

var entity = argument0;
var item = argument1;

ASSERT(item != -1, "No item in EntityEquipStart()");

if ItemIsEquipped(item, entity){
    entity.action = ENTITY_ACTION.UNEQUIP;
    entity.action_alarm = 15;
    entity.action_item = item;
    EntitySetSpriteUse(entity);
    scr_action_start();
    return true;
    }
    
return false;
