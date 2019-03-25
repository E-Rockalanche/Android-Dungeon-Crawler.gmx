//writes entity data to a buffer

var buf = argument0;
var entity = argument1;

if !instance_exists(entity){
    ASSERT(false, "***ERROR: trying to save non-existent entity with id = "+string(entity));
    for(var mi = 0; mi < width; ++mi){
        for(var mj = 0; mj < height; ++mj){
            var cell = map[# mi,mj];
            if cell.entity == entity{
                ASSERT(false, "entity_id "+string(entity)+" is on position ("+string(mi)+","+string(mj)+")");
                }
            }
        }
    }

show_debug_message("Saving entity "+string(entity)+", name: "+EntityGetName(entity));
buffer_write(buf, buffer_string, "entity test");
buffer_write(buf, buffer_s32, entity);
//ftwr_space(fout, entity);

with(entity){

    //save name
    buffer_write(buf, buffer_string, name);
    //file_text_write_string(fout, name+" "); file_text_writeln(fout);

    //save sprites
    buffer_write(buf, buffer_u32, sprite_index);
    buffer_write(buf, buffer_u32, sprite_stand);
    buffer_write(buf, buffer_u32, sprite_walk);
    buffer_write(buf, buffer_u32, sprite_attack);
    buffer_write(buf, buffer_u32, sprite_die);
    buffer_write(buf, buffer_u32, sprite_sleep);
    buffer_write(buf, buffer_u32, sprite_use);
    buffer_write(buf, buffer_bool, loop_sprite);
    buffer_write(buf, buffer_f32, image_speed);
    buffer_write(buf, buffer_u8, img_index);
    buffer_write(buf, buffer_s8, img_xscale);
    /*
    ftwr_space(fout, sprite_index);
    ftwr_space(fout, sprite_stand);
    ftwr_space(fout, sprite_walk);
    ftwr_space(fout, sprite_attack);
    ftwr_space(fout, sprite_die);
    ftwr_space(fout, sprite_sleep);
    ftwr_space(fout, loop_sprite);
    ftwr_space(fout, image_speed);
    ftwr_space(fout, img_index);
    ftwr_space(fout, img_xscale);
    */
    //draw x,y can be recalculated
    
    //size/position
    buffer_write(buf, buffer_u8, size);
    buffer_write(buf, buffer_u8, i);
    buffer_write(buf, buffer_u8, j);
    /*
    ftwr_space(fout, size);
    ftwr_space(fout, i);
    ftwr_space(fout, j);
    */
    //can get cell id on load
    
    //states
    buffer_write(buf, buffer_u8, state);
    buffer_write(buf, buffer_u8, action);
    buffer_write(buf, buffer_u8, alliance);
    /*
    ftwr_space(fout, state);
    ftwr_space(fout, action);
    ftwr_space(fout, alliance);
    */
    
    //item permissions
    buffer_write(buf, buffer_bool, can_pick_up);
    buffer_write(buf, buffer_bool, can_use_items);
    /*
    ftwr_space(fout, can_pick_up);
    ftwr_space(fout, can_use_items);
    */
    
    //turn timer
    buffer_write(buf, buffer_f32, turn_timer);
    //ftwr_space(fout, turn_timer);
    
    SavePathStack(buf, path_stack);
    
    //direction
    buffer_write(buf, buffer_f32, current_direction);
    //ftwr_space(fout, current_direction);
    
    SaveArray(buf, permissions, TILE.LENGTH);
    
    SaveInventory(buf, inventory);
    
    buffer_write(buf, buffer_u16, gold);
    //ftwr_space(fout, gold);
    
    //equipment
    buffer_write(buf, buffer_s32, weapon);
    buffer_write(buf, buffer_s32, armour);
    buffer_write(buf, buffer_s32, ring1);
    buffer_write(buf, buffer_s32, ring2);
    /*
    ftwr_space(fout, weapon);
    ftwr_space(fout, armour);
    ftwr_space(fout, ring1);
    ftwr_space(fout, ring2);
    */
    //will need translate equipment ID's
    
    buffer_write(buf, buffer_u8, goals);
    buffer_write(buf, buffer_u16, morale);
    buffer_write(buf, buffer_u16, adrenaline);
    //ftwr_space(fout, goals);
    //can rebuild priority list of goals
    //ftwr_space(fout, morale);
    
    buffer_write(buf, buffer_bool, alert_player_on_sight);
    //ftwr_space(fout, alert_player_on_sight);
    
    SaveArray(buf, status_effect, STATUS.LENGTH);
    
    //bit flags
    buffer_write(buf, buffer_u32, abilities);
    buffer_write(buf, buffer_u32, resistances);
    buffer_write(buf, buffer_u32, immunities);
    /*
    file_text_write_string(fout, string_format(abilities, 10, 0)+" ");
    file_text_write_string(fout, string_format(resistances, 10, 0)+" ");
    file_text_write_string(fout, string_format(immunities, 10, 0)+" ");
    */
    //ftwr_space(fout, abilities);
    //ftwr_space(fout, resistances);
    //ftwr_space(fout, immunities);
    
    //stats
    buffer_write(buf, buffer_u16, strength);
    buffer_write(buf, buffer_u16, agility);
    buffer_write(buf, buffer_u16, perception);
    buffer_write(buf, buffer_u16, intelligence);
    buffer_write(buf, buffer_u16, dexterity);
    buffer_write(buf, buffer_u16, constitution);
    buffer_write(buf, buffer_u16, max_hp);
    buffer_write(buf, buffer_u16, hp);
    buffer_write(buf, buffer_u16, hp_regen);
    buffer_write(buf, buffer_u16, max_mp);
    buffer_write(buf, buffer_u16, mp);
    buffer_write(buf, buffer_u16, mp_regen);
    buffer_write(buf, buffer_u16, defense);
    buffer_write(buf, buffer_u16, move_speed);
    buffer_write(buf, buffer_u16, attack_speed);
    buffer_write(buf, buffer_u16, accuracy);
    buffer_write(buf, buffer_u16, dodge);
    buffer_write(buf, buffer_u16, throw_distance);
    buffer_write(buf, buffer_u16, combo);
    buffer_write(buf, buffer_u16, detection);
    buffer_write(buf, buffer_u16, stealth);
    /*
    ftwr_space(fout, strength);
    ftwr_space(fout, agility);
    ftwr_space(fout, perception);
    ftwr_space(fout, intelligence);
    ftwr_space(fout, dexterity);
    ftwr_space(fout, constitution);
    ftwr_space(fout, max_hp);
    ftwr_space(fout, hp);
    ftwr_space(fout, hp_regen);
    ftwr_space(fout, max_mp);
    ftwr_space(fout, mp);
    ftwr_space(fout, mp_regen);
    ftwr_space(fout, defense);
    ftwr_space(fout, move_speed);
    ftwr_space(fout, attack_speed);
    ftwr_space(fout, accuracy);
    ftwr_space(fout, dodge);
    ftwr_space(fout, throw_distance);
    ftwr_space(fout, combo);
    ftwr_space(fout, detection);
    ftwr_space(fout, stealth);
    */
    
    //other stats
    buffer_write(buf, buffer_u16, fatigue);
    buffer_write(buf, buffer_u16, stomach_size);
    buffer_write(buf, buffer_u16, hunger);
    buffer_write(buf, buffer_u16, metabolism);
    /*
    ftwr_space(fout, fatigue);
    ftwr_space(fout, stomach_size);
    ftwr_space(fout, hunger);
    ftwr_space(fout, metabolism);
    */
    }
