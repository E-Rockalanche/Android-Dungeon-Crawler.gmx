//executed by obj_floor

var enemy = -1;
switch(irandom(ENEMY.LENGTH-1)){
    case ENEMY.RAT:
        enemy = Rat();
        break;
        
    case ENEMY.BAT:
        enemy = Bat();
        break;
        
    case ENEMY.GHOST:
        enemy = Ghost();
        break;
        
    case ENEMY.FISH:
        enemy = Fish();
        break;
        
    case ENEMY.THIEF:
        enemy = Thief();
        break;
        
    default:
        ASSERT(false, "Unknown enemy type in EnemyCreate()");
    }
    
ASSERT(enemy != -1, "No enemy to return in EnemeyCreate()");    

show_debug_message("Created "+EntityGetName(enemy));

with(enemy){
    scr_initgoals_all();
    InventoryAdd(inventory, ItemCreate(other.floor_depth, ITEM_CATEGORY.POTION, POTION.HEALTH, 1));
    }

return enemy;
