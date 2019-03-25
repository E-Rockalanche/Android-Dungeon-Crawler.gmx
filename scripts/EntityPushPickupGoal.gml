/*
var entity = argument0;
var cell = argument1;
var item = argument2;

ASSERT(entity != -1, "Entity does not exist in EntityPushKillGoal()");
ASSERT(target != -1, "Target does not exist in EntityPushKillGoal()");

var goal = instance_create(0,0,obj_goal);
goal.cell = cell;
goal.item = item;
goal.type = GOAL.PICK_UP_ITEM;

EntityPushGoal(entity, goal);
