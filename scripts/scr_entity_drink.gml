//executed by obj_entity

show_debug_message("scr_entity_drink()");

switch(ItemType(action_item)){
    case POTION.HEALTH:
        hp = max_hp;
        SplashText(draw_x, draw_y, "Healed", c_green);
        break;
        
    case POTION.FIRE:
        EntitySetOnFire(id);
        break;
        
    case POTION.STRENGTH:
        strength++;
        break;
        
    case POTION.AGILITY:
        agility++;
        break;
        
    case POTION.CONFUSION:
        EntityConfuse(id, 10);
        break;
        
    case POTION.POISON:
        EntityPoison(id, 10);
        break;
        
    case POTION.PARALYSIS:
        EntityParalyze(id, 10);
        break;
        
    default:
        ASSERT(false, "Unknown potion type in scr_entity_drink()");
    }

var potion = InventoryDeplete(inventory, action_item, 1);
ItemDestroy(potion);
turn_timer = 1;
scr_action_end();
