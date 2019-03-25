var entity = argument[0];
var action = argument[1];
var item = argument[2]
var cell = argument[3];

entity.action_item = item;
entity.action_cell = cell;
antity.action = action;

//start animation
switch(action){
    case ENTITY_ACTION.ATTACK:
        break;
    case ENTITY_ACTION.EAT:
        break;
    case ENTITY_ACTION.DRINK:
        break;
    case ENTITY_ACTION.READ:
        break;
    case ENTITY_ACTION.THROW:
        break;
    case ENTITY_ACTION.DROP:
        break;
    case ENTITY_ACTION.PICK_UP:
        break;
    case ENTITY_ACTION.ZAP_WAND:
        break;
    default:
        ASSERT(false, "Unknown action in EntityStartAction()");
        break;
    }
