//execyted by obj_game

var entity = argument0;
var item = argument1;

ASSERT(item != -1, "No item in EntityEquipStart()");

var category = ItemCategory(item);

if (BL(category) & ITEM_CAN_BE_EQUIPPED){
    //item can be equipped
    entity.action = ENTITY_ACTION.EQUIP;
    entity.action_alarm = 15;
    entity.action_item = item;
    EntitySetSpriteUse(entity);
    scr_action_start();
    return true;
    }
    
//item cannot be equipped
return false;
