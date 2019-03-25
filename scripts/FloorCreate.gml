var cur_floor = argument0;

random_set_seed(cur_floor.seed);
show_debug_message("Set seed to "+string(cur_floor.seed));

cur_floor.entity_list = ds_list_create();
cur_floor.item_list = ds_list_create();
cur_floor.object_list = ds_list_create();
cur_floor.animated_cells = ds_list_create();
FloorCreateMap(cur_floor);
