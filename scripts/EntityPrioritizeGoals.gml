var entity = argument0;

ASSERT(entity != -1, "No entity in EntityPrioritizeGoals()");

//show_debug_message("EntityPrioritizeGoals( "+EntityGetName(entity)+" )");

var list = entity.goal_list;
for(var n = 0; n < GOAL.LENGTH; n++){
    if (entity.goals & BL(n)){
        var priority = 0;
        switch(n){
            case GOAL.WANDER:
                priority = 0;
                break;
            
            case GOAL.KILL_ENEMIES:
                priority = entity.in_view /* + enragement*/;
                break;
                
            case GOAL.RUN_AWAY:
                priority = EntityDamageTaken(entity) - entity.morale;
                break;
                
            case GOAL.SLEEP:
                //enemies will sleep
                priority = entity.fatigue - entity.adrenaline - 99;
                break;
                
            case GOAL.HEAL:
                //use item, magic, or ability to heal
                priority = (InventoryHasItem(entity.inventory, ITEM_CATEGORY.POTION, POTION.HEALTH) != -1)*EntityDamageTaken(entity)*10;
                break;
                
            case GOAL.GUARD:
                priority = CellDistance(entity.cell, entity.guard_position);
                break;
            
            default:
                priority = INT_MIN;
                break;
            }
        ds_priority_change_priority(entity.goal_list, n, priority);
        //show_debug_message("Goal "+goal_string[n]+" given priority "+string(priority));
        }
    }
