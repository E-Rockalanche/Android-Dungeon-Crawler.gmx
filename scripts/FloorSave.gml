var cur_floor = argument0;

instance_activate_object(cur_floor);
with(cur_floor){
    var floor_name = "FLOOR_"+string(floor_depth);
    ini_open("save.ini");
    
    ini_write_real(floor_name, "initialized", initialized);
    ini_write_real(floor_name, "seed", seed);
    ini_write_real(floor_name, "width", width);
    ini_write_real(floor_name, "height", height);
    ini_write_real(floor_name, "depth", floor_depth);
    
    var str;
    //iterate through entity list?
    //rebuild lists?
    str = ds_list_write(entity_list);
    ini_write_string(floor_name, "entity_list", str);
    str = ds_list_write(item_list);
    ini_write_string(floor_name, "item_list", str);
    str = ds_list_write(object_list);
    ini_write_string(floor_name, "object_list", str);
    str = ds_list_write(water_list);
    ini_write_string(floor_name, "water_list", str);
    str = ds_list_write(outline_list);
    ini_write_string(floor_name, "outline_list", str);
    
    if initialized{
        str = ds_map_write(map);
        ini_write_string(floor_name, "map", str);
        ini_write_string(floor_name, "stairs_down", stairs_down);
        ini_write_string(floor_name, "stairs_up", stairs_up);
        ini_write_string(floor_name, "dungeon_exit", dungeon_exit);
        }
    ini_close();
    }
