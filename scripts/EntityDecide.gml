var entity = argument0;

var name = EntityGetName(entity);

show_debug_message("EntityDecide( "+name+" )");

entity.target = player;

EntityPrioritizeGoals(entity);

var goal = ds_priority_find_max(entity.goal_list);
switch(goal){
    case GOAL.WANDER:
        //set path
        EntityWander(entity);
        break;
    
    case GOAL.KILL_ENEMIES:
        if EntityCanAttackTarget(entity){
            //attack enemy
            EntitySetupAttack(entity);
            }
        else if EntityMoveTowardsCell(entity, entity.target.cell){
            //moving towards enemy
            }
        else if !ds_stack_empty(entity.path_stack){
            //use known path to enemy
            ds_list_add(will_move_list, entity);
            entity.action = ENTITY_ACTION.WILL_MOVE;
            }
        else{
            //wander
            EntityWander(entity);
            }
        break;
        
    case GOAL.RUN_AWAY:
        //find threats
        //flee from all threats
        show_debug_message(name+" will flee");
        break;
        
    case GOAL.SLEEP:
        //go to sleep state
        entity.state = ENTITY_STATE.SLEEPING;
        show_debug_message(name+" will sleep");
        break;
        
    case GOAL.HEAL:
        entity.action_item = InventoryHasItem(entity.inventory, ITEM_CATEGORY.POTION, POTION.HEALTH);
        entity.action = ENTITY_ACTION.DRINK;
        ds_list_add(action_list, entity);
        show_debug_message(name+" will heal with a potion");
        break;
        
    case GOAL.GUARD:
        //move back to guard point
        EntityMoveTowardsCell(entity, entity.guard_position);
        show_debug_message(name+" will guard");
        break;
    
    default:
        ASSERT(false, EntityGetName(entity)+" does not have goal "+string(goal));
        break;
    }
