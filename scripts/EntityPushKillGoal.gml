/*
var entity = argument0;
var target = argument1;

ASSERT(entity != -1, "Entity does not exist in EntityPushKillGoal()");
ASSERT(target != -1, "Target does not exist in EntityPushKillGoal()");

var goal = instance_create(0,0,obj_goal);
goal.entity = target;
goal.type = GOAL.KILL_ENTITY;

EntityPushGoal(entity, goal);
