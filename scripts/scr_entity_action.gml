//executed by obj_entity
//triggered by action_alarm

switch(action){
    case ENTITY_ACTION.THROW:
        scr_entity_throw();
        break;
    
    case ENTITY_ACTION.ZAP_WAND:
        scr_entity_zap();
        break;
    
    case ENTITY_ACTION.EAT:
        scr_entity_eat();
        break;
    
    case ENTITY_ACTION.DRINK:
        scr_entity_drink();
        break;
    
    case ENTITY_ACTION.READ:
        scr_entity_read();
        break;
    
    case ENTITY_ACTION.DROP:
        scr_entity_drop();
        break;
    
    case ENTITY_ACTION.PICK_UP:
        scr_entity_pick_up();
        break;
    
    case ENTITY_ACTION.ATTACK:
        scr_entity_attack();
        break;
    
    case ENTITY_ACTION.EQUIP:
        scr_entity_equip();
        break;
    
    case ENTITY_ACTION.UNEQUIP:
        scr_entity_unequip();
        break;
    
    default:
        ASSERT(false, "Unknown action ( "+string(action)+" ) in scr_entity_action() for entity "+EntityGetName(id));
        break;
    }

EntitySetSpriteStand(id);
