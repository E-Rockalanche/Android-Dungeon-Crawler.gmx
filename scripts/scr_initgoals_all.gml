/*
executed by obj_entity

all goals except such gpals that conflict with other more important goals

protect treasure
guard
*/

EntityAddGoal(id, GOAL.KILL_ENEMIES);
EntityAddGoal(id, GOAL.RUN_AWAY);
EntityAddGoal(id, GOAL.SLEEP);
EntityAddGoal(id, GOAL.WANDER);
EntityAddGoal(id, GOAL.NOTHING);
EntityAddGoal(id, GOAL.HEAL);
