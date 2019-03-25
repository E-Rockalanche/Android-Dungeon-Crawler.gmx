var entity = argument0;
var goal = argument1;

entity.goals = entity.goals | BL(goal);
ds_priority_add(entity.goal_list, goal, 0);
