var enemy = argument0;

var goal = instance_create(0,0,obj_goal);
goal.type = GOAL.KILL_ENEMIES;

EntityPushGoal(enemy, goal);
