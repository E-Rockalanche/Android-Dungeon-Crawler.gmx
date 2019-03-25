//executed in scr_ai_turn

var entity = argument0;

ASSERT(entity != -1, "No entity in EntityAction()");

show_debug_message("EntityAction( "+EntityGetName(entity)+", "+action_string[entity.action]+" )");

switch(entity.action){
    case ENTITY_ACTION.THROW:
        EntityThrow(entity, entity.action_item, entity.action_cell);
        break;
    
    case ENTITY_ACTION.ZAP_WAND:
        EntityThrow(entity, entity.action_item, entity.action_cell);
        break;
    
    case ENTITY_ACTION.EAT:
        break;
    
    case ENTITY_ACTION.DRINK:
        EntityDrink(entity, entity.action_item);
        break;
    
    case ENTITY_ACTION.READ:
        EntityRead(entity, entity.action_item);
        break;
    
    case ENTITY_ACTION.DROP:
        break;
    
    case ENTITY_ACTION.PICK_UP:
        break;
    
    case ENTITY_ACTION.ATTACK:
        EntityAttack(entity);
        break;
    
    case ENTITY_ACTION.EQUIP:
        break;
    
    case ENTITY_ACTION.UNEQUIP:
        break;
    }
