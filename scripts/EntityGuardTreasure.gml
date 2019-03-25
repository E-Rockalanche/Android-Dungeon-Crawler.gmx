var entity = argument0;
/*
    
//add treasure
show_debug_message(EntityGetName(entity)+" will guard treasure");
var i, j, cell;
repeat(irandom_range_clump(1, 5, 2)){
    i = clamp(irandom_range(entity.i-1, entity.i+1), 0, width-1);
    j = clamp(irandom_range(entity.j-1, entity.j+1), 0, height-1);
    cell = map[# i,j];
    if (BL(cell.tile) & TILE_IS_GROUND){
        //place treasure
        CellAddItem(cell, ItemCreate(floor_depth, ITEM_CATEGORY.GOLD));
        show_debug_message("Added treasure to map");
        }
    }

//push treasure goal
ds_stack_empty(entity.goal_stack);
var goal = instance_create(0,0,obj_goal);
goal.type = GOAL.GUARD_TREASURE;
goal.cell = entity.cell;
EntityPushGoal(entity, goal);
