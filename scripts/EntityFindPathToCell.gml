//executed by control
//inputs path nodes into given ds_stack
//returns if operation was successful

var entity, start, goal;

entity = argument0;
goal = argument1;

var time = current_time;

show_debug_message("EntityFindPathToCell( "+EntityGetName(entity)+", "+string(goal)+" )");

ds_stack_clear(entity.path_stack);

var other_entity = goal.entity;
if (other_entity != -1){
    show_debug_message("Pathfinding to entity "+EntityGetName(other_entity));
    }

if AstarFindPath(entity, goal)//creates path in map
    {
    EntityPathConstruct(entity, goal);//follows path in map
    
    time = current_time - time;
    show_debug_message("   took "+string(time)+"ms");
    
    return true;
    }
else{
    time = current_time - time;
    show_debug_message("   took "+string(time)+"ms");
    
    return false;
    }
