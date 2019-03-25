/*
var entity = argument0;
var goal = argument1;

ASSERT(entity != -1, "Entity does not exist in EntityAddGoal()");
ASSERT(goal != -1, "Goal does not exist in EntityAddGoal()");

ds_stack_push(entity.goal_stack, goal);
