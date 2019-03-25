with(instance_create(0,0,obj_game)){
    player = Player();

    map_width = argument0;
    map_height = argument1;
    dungeon_size = argument2;
    
    //draw_map[map_width-1, map_height-1] = 0;
    
    floors[dungeon_size-1] = 0;//initialize array size

    seed_string = SeedGet();
    //seed_string = "test";
    seed = SeedConvert(seed_string);
    random_set_seed(seed);

    for(var d = 0; d < dungeon_size; d++){
        var cur_floor = instance_create(0,0,obj_floor);
        instance_deactivate_object(cur_floor);
        
        cur_floor.seed = irandom(INT_MAX);
        cur_floor.width = map_width;
        cur_floor.height = map_height;
        cur_floor.floor_depth = d+1;
        floors[d] = cur_floor;
        
        show_debug_message("floor level "+string(d+1)+" seed: "+string(cur_floor.seed));
        }
    
    FloorSetCurrent(floors[0]);
    }
