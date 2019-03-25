var cell = argument0;

var time = current_time;

interaction_cell = cell;
EntityFindPathToCell(player, cell);
player_automove = true;

time = current_time - time;
show_debug_message("------ Player pathfinding took "+string(time)+"ms ------");
