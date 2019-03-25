//executed by obj_game

show_debug_message("LoadGame()");

var filename = argument0;

var time = current_time;

var buf = buffer_load(filename);

if !buffer_exists(buf){
    ASSERT(false, "***ERROR: buffer was not loaded");
    return false;
    }
else{

    entity_id = ds_map_create(); entity_id[? -1] = -1;
    cell_id = ds_map_create(); cell_id[? -1] = -1;
    item_id = ds_map_create(); item_id[? -1] = -1;
    
    show_debug_message(buffer_read(buf, buffer_string));//save system message
    
    game_state = buffer_read(buf, buffer_u8);
    player_depth = buffer_read(buf, buffer_u8);
    max_player_depth = buffer_read(buf, buffer_u8);
    map_turn_timer = buffer_read(buf, buffer_f32);
    
    map_width = buffer_read(buf, buffer_u8);
    map_height = buffer_read(buf, buffer_u8);
    dungeon_size = buffer_read(buf, buffer_u8);
    
    seed_string = buffer_read(buf, buffer_string);
    seed = buffer_read(buf, buffer_s32);
    random_set_seed(buffer_read(buf, buffer_u64));//current seed
    
    ASSERT(buffer_read(buf, buffer_string) == "save test", "***ERROR: failed save test in LoadGame() before loading floors");
    
    for(var n = 0; n < dungeon_size; n++){
    show_debug_message("Loading floor "+string(n));
        floors[n] = LoadFloor(buf, entity_id, cell_id, item_id);
        }
        
    show_debug_message("setting current floor to player_depth");
    var cur_floor = floors[player_depth-1];//player depth is 1 relative
    map = cur_floor.map;
    scr_set_map_tiles();
    scr_reset_animated_tiles();
    
    map_width = cur_floor.width;
    map_height = cur_floor.height;
    
    //floor lists
    entity_list = cur_floor.entity_list;
    item_list = cur_floor.item_list;
    object_list = cur_floor.object_list;
    fire_list = cur_floor.fire_list;
    gas_list = cur_floor.gas_list;
    
    //gas grid
    gas_density_grid = cur_floor.gas_density_grid;
    gas_type_grid = cur_floor.gas_type_grid;
    
    player_automove = false;
    
    //set player view
    scr_update_player_view();
    
    ds_list_clear(decide_list);
    ds_list_clear(will_move_list);
    ds_list_clear(moving_list);
    ds_list_clear(action_list);
    
    ASSERT(buffer_read(buf, buffer_string) == "end of save file", "***ERROR: buffer does not end with 'end of save file'");
    
    buffer_delete(buf);
    
    ds_map_destroy(entity_id);
    ds_map_destroy(cell_id);
    ds_map_destroy(item_id);
    
    show_debug_message("Loaded in "+string(current_time - time)+" milliseconds");
    
    return true;
    }
