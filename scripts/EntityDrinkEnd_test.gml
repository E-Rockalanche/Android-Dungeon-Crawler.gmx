//executed by obj_entity

var potion = event.item;

switch(potion[? ITEM.TYPE]){
    case POTION.HEALTH:
        hp = max_hp;
        break;
        
    case POTION.FIRE:
        with(obj_game){
            EntitySetOnFire(other);
            }
        break;
        
    case POTION.STRENGTH:
        strength++;
        break;
        
    case POTION.AGILITY:
        agility++;
        break;
        
    case POTION.CONFUSION:
        //confuse entity
        break;
        
    case POTION.POISON:
        //poison entity
        break;
        
    case POTION.PARALYSIS:
        //paralyze entity
        break;
        
    default:
        ASSERT(false, "Unknown potion type in EntityDrinkEnd()");
    }

potion = InventoryDeplete(inventory, potion, 1);
ItemDestroy(potion);
turn_timer = 1;

game_state = GAME_STATE.AI_TURN;
