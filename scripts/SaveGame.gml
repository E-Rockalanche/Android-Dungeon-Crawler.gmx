//executed by obj_game

show_debug_message("SaveGame()");

var filename = argument0;

var time = current_time;

var buf = buffer_create(1, buffer_grow, 1);

if !buffer_exists(buf){
    ASSERT(false, "***ERROR: buffer was not created");
    return false;
    }
else{
    buffer_write(buf, buffer_string, "Buffer save file system created by Eric Roberts, 2017");
    
    show_debug_message("   saving game state");
    
    buffer_write(buf, buffer_u8, game_state);
    buffer_write(buf, buffer_u8, player_depth);
    buffer_write(buf, buffer_u8, max_player_depth);
    buffer_write(buf, buffer_f32, map_turn_timer);
    
    buffer_write(buf, buffer_u8, map_width);
    buffer_write(buf, buffer_u8, map_height);
    buffer_write(buf, buffer_u8, dungeon_size);
    
    buffer_write(buf, buffer_string, seed_string);
    buffer_write(buf, buffer_s32, seed);
    buffer_write(buf, buffer_u64, random_get_seed());//current seed
    
    buffer_write(buf, buffer_string, "save test");
    
    for(var n = 0; n < dungeon_size; n++){
        show_debug_message("Saving floor "+string(n));
        SaveFloor(buf, floors[n]);
        }
        
    buffer_write(buf, buffer_string, "end of save file");
    
    buffer_save(buf, filename);
    buffer_delete(buf);
    
    show_debug_message("Saved in "+string(current_time - time)+" milliseconds");
    
    return true;
    }
