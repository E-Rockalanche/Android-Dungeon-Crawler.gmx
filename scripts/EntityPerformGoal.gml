/*
var entity = argument0;

ASSERT(entity != -1, "Entity does not exist in EntityPerformGoal()");

show_debug_message("EntityPerformGoal( "+EntityGetName(entity)+" )");

var stack = entity.goal_stack;

var goal = ds_stack_top(stack);
switch(goal.type){
    case GOAL.FIND_TREASURE:
        //wander, or follow treasure dijkstra map
        var item = CellHasItem(entity.cell, ITEM_CATEGORY.GOLD);
        if (item != -1){
            EntityPushPickupGoal(entity, entity.cell, item);
            EntityPerformGoal(entity);
            }
        else{
            EntityWander(entity);
            }
        break;
    
    case GOAL.PICK_UP_ITEM:
        //pick up item
        if (entity.cell == goal.cell){
            EntityPopGoal(entity);
            //setup pick up action
            }
        //move towards item
        else{
            EntityMoveTowardsCell(entity, goal.cell);
            }
        break;
    
    case GOAL.GUARD_TREASURE:
        //attack enemy
        if (entity.in_view && EntityIsAlive(player)){
            EntityPushKillGoal(entity, player);
            EntityPerformGoal(entity);
            }
        //go back to treasure
        else if (CellDistance(entity.cell, goal.cell) > 1){
            EntityMoveTowardsCell(entity, goal.cell);
            }
        //wander around treasure or go to sleep?
        else{
            EntityWander(entity);
            }
        break;
    
    case GOAL.MOVE_TO_CELL:
        //revert goal
        if (entity.cell == goal.cell){
            EntityPopGoal(entity);
            EntityPerformGoal(entity);
            }
        //move to cell
        else{
            EntityMoveTowardsCell(entity, goal.cell);
            }
        break;
    
    case GOAL.KILL_ENEMIES:
        //target enemy
        if (entity.in_view && EntityIsAlive(player)){
            EntityPushKillGoal(entity, player);
            EntityPerformGoal(entity);
            }
        //wander dungeon
        else{
            EntityWander(entity);
            }
        break;
    
    case GOAL.KILL_ENTITY:
        //try to attack target
        entity.target = goal.entity;
        if EntityCanAttackTarget(entity){
            EntitySetupAttack(entity);
            }
        //move towards target if in view
        else if entity.in_view{
            EntityMoveTowardsCell(entity, entity.target.cell);
            }
        //try to find target
        else if !EntityFollowPath(entity){
            //cannot find target, revert goal
            EntityPopGoal(entity);
            EntityPerformGoal(entity);
            }
        break;
    
    case GOAL.MOVE_TO_ENTITY:
        //move to entity
        if (entity.in_view && EntityIsAlive(goal.entity)){
            EntityMoveTowardsCell(entity, goal.entity.cell);
            }
        //try to find entity
        else{
            EntityPushFindEntityGoal(entity, goal.entity);
            EntityPerformGoal(entity);
            }
        //if entity in sight, move to entity, else find entity
        break;
    
    case GOAL.FIND_ENTITY:
        //found entity
        if entity.in_view{
            EntityPopGoal(entity);
            EntityPerformGoal(entity);
            }
        //try to follow path to entity
        else if !EntityFollowPath(entity){
            //cannot find entity
            EntityWander(entity);
            }
        break;
    
    default:
        ASSERT(false, "Unknown goal in EntityPerformGoal()");
    }
