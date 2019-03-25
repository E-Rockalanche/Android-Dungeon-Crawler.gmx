var buf = argument0;
var entity_id = argument1;//ds_map
var cell_id = argument2;//ds_map
var item_id = argument3;//ds_map

var test_str = buffer_read(buf, buffer_string);
show_debug_message("entity test == "+test_str);
ASSERT(test_str == "entity test", "***ERROR: buffer load out of sync at LoadEntity()");

var entity = instance_create(0,0,obj_entity);

var old_id = buffer_read(buf, buffer_s32);
show_debug_message("old_id == "+string(old_id));
entity_id[? old_id] = entity;//load id
//entity_id[? file_text_read_real(fin)] = entity;//load id

var new_map = map;//floor.map

with(entity){
    //load name
    name = "";
    //name = file_text_read_string(fin);
    name = buffer_read(buf, buffer_string);
    show_debug_message("   loading entity "+name);
    
    ASSERT(string_length(string_digits(name)) == 0, "***ERROR: invalid name loaded: "+name);

    //load sprites
    sprite_index = buffer_read(buf, buffer_u32);
    sprite_stand = buffer_read(buf, buffer_u32);
    sprite_walk = buffer_read(buf, buffer_u32);
    sprite_attack = buffer_read(buf, buffer_u32);
    sprite_die = buffer_read(buf, buffer_u32);
    sprite_sleep = buffer_read(buf, buffer_u32);
    sprite_use = buffer_read(buf, buffer_u32);
    loop_sprite = buffer_read(buf, buffer_bool);
    image_speed = buffer_read(buf, buffer_f32);
    img_index = buffer_read(buf, buffer_u8);
    img_xscale = buffer_read(buf, buffer_s8);
    /*
    sprite_index = file_text_read_real(fin);
    sprite_stand = file_text_read_real(fin);
    sprite_walk = file_text_read_real(fin);
    sprite_attack = file_text_read_real(fin);
    sprite_die = file_text_read_real(fin);
    sprite_sleep = file_text_read_real(fin);
    loop_sprite = file_text_read_real(fin);
    image_speed = file_text_read_real(fin);
    img_index = file_text_read_real(fin);
    img_xscale = file_text_read_real(fin);
    */
    //draw x,y can be recalculated
    
    //size/position
    size = buffer_read(buf, buffer_u8);
    
    ASSERT(size < 3, "***ERROR: loaded entity of size "+string(size));
    
    i = buffer_read(buf, buffer_u8);
    j = buffer_read(buf, buffer_u8);
    /*
    size = file_text_read_real(fin);
    i = file_text_read_real(fin);
    j = file_text_read_real(fin);
    */
    
    ASSERT(i >= 0 && j >= 0 && i < ds_grid_width(new_map) && j < ds_grid_height(new_map), "***ERROR: entity position out of map: ("+string(i)+","+string(j)+")");
    
    cell = new_map[# i,j];
    EntitySetDrawPos(id);
    
    //states
    state = buffer_read(buf, buffer_u8);
    action = buffer_read(buf, buffer_u8);
    alliance = buffer_read(buf, buffer_u8);
    /*
    state = file_text_read_real(fin);
    action = file_text_read_real(fin);
    alliance = file_text_read_real(fin);
    */
    
    //item permissions
    can_pick_up = buffer_read(buf, buffer_bool);
    can_use_items = buffer_read(buf, buffer_bool);
    /*
    can_pick_up = file_text_read_real(fin);
    can_use_items = file_text_read_real(fin);
    */
    
    //turn timer
    turn_timer = buffer_read(buf, buffer_f32);
    //turn_timer = file_text_read_real(fin);
    
    path_stack = LoadPathStack(buf, new_map);
    
    //direction
    current_direction = buffer_read(buf, buffer_f32);
    //current_direction = file_text_read_real(fin);
    
    permissions = LoadArray(buf, TILE.LENGTH);
    
    LoadInventory(buf, inventory, item_id);
    
    gold = buffer_read(buf, buffer_u16);
    //gold = file_text_read_real(fin);//player only
    
    //equipment
    weapon = item_id[? buffer_read(buf, buffer_s32)];
    armour = item_id[? buffer_read(buf, buffer_s32)];
    ring1 = item_id[? buffer_read(buf, buffer_s32)];
    ring2 = item_id[? buffer_read(buf, buffer_s32)];
    /*
    weapon = item_id[? file_text_read_real(fin)];
    armour = item_id[? file_text_read_real(fin)];
    ring1 = item_id[? file_text_read_real(fin)];
    ring2 = item_id[? file_text_read_real(fin)];
    */
    
    goals = buffer_read(buf, buffer_u8);
    morale = buffer_read(buf, buffer_u16);
    adrenaline = buffer_read(buf, buffer_u16);
    //goals = file_text_read_real(fin);
    //morale = file_text_read_real(fin);
    for(var n = 0; n < GOAL.LENGTH; n++){
        if (goals & BL(n)){
            EntityAddGoal(id, n);
            }
        }
    
    alert_player_on_sight = buffer_read(buf, buffer_bool);
    //alert_player_on_sight = file_text_read_real(fin);
    
    status_effect = LoadArray(buf, STATUS.LENGTH);
    
    //bit flags
    abilities = buffer_read(buf, buffer_u32);
    resistances = buffer_read(buf, buffer_u32);
    immunities = buffer_read(buf, buffer_u32);
    /*
    abilities = file_text_read_real(fin);
    resistances = file_text_read_real(fin);
    immunities = file_text_read_real(fin);
    */
    
    //stats
    strength = buffer_read(buf, buffer_u16);
    agility = buffer_read(buf, buffer_u16);
    perception = buffer_read(buf, buffer_u16);
    intelligence = buffer_read(buf, buffer_u16);
    dexterity = buffer_read(buf, buffer_u16);
    constitution = buffer_read(buf, buffer_u16);
    max_hp = buffer_read(buf, buffer_u16);
    hp = buffer_read(buf, buffer_u16);
    hp_regen = buffer_read(buf, buffer_u16);
    max_mp = buffer_read(buf, buffer_u16);
    mp = buffer_read(buf, buffer_u16);
    mp_regen = buffer_read(buf, buffer_u16);
    defense = buffer_read(buf, buffer_u16);
    move_speed = buffer_read(buf, buffer_u16);
    attack_speed = buffer_read(buf, buffer_u16);
    accuracy = buffer_read(buf, buffer_u16);
    dodge = buffer_read(buf, buffer_u16);
    throw_distance = buffer_read(buf, buffer_u16);
    combo = buffer_read(buf, buffer_u16);
    detection = buffer_read(buf, buffer_u16);
    stealth = buffer_read(buf, buffer_u16);
    /*
    strength = file_text_read_real(fin, );
    agility = file_text_read_real(fin);
    perception = file_text_read_real(fin);
    intelligence = file_text_read_real(fin);
    dexterity = file_text_read_real(fin);
    constitution = file_text_read_real(fin);
    max_hp = file_text_read_real(fin);
    hp = file_text_read_real(fin);
    hp_regen = file_text_read_real(fin);
    max_mp = file_text_read_real(fin);
    mp = file_text_read_real(fin);
    mp_regen = file_text_read_real(fin);
    defense = file_text_read_real(fin);
    move_speed = file_text_read_real(fin);
    attack_speed = file_text_read_real(fin);
    accuracy = file_text_read_real(fin);
    dodge = file_text_read_real(fin);
    throw_distance = file_text_read_real(fin);
    combo = file_text_read_real(fin);
    detection = file_text_read_real(fin);
    stealth = file_text_read_real(fin);
    */
    
    //other stats
    fatigue = buffer_read(buf, buffer_u16);
    stomach_size = buffer_read(buf, buffer_u16);
    hunger = buffer_read(buf, buffer_u16);
    metabolism = buffer_read(buf, buffer_u16);
    /*
    fatigue = file_text_read_real(fin);
    stomach_size = file_text_read_real(fin);
    hunger = file_text_read_real(fin);
    metabolism = file_text_read_real(fin);
    */
    }
    
if (entity.state == ENTITY_STATE.PLAYER){
    obj_game.player = entity;
    }

return entity;
