var cur_floor = argument0;

show_debug_message("Destroying floor "+string(cur_floor.floor_depth));

instance_activate_object(cur_floor);
with(cur_floor){
    EntityListDestroy(entity_list);
    ds_list_destroy(item_list);
    ds_list_destroy(object_list);
    ds_list_destroy(water_list);
    
    if initialized{
        MapDestroy(map);
        if DEBUG{
            for(var n = 0; n < ds_list_size(outline_list); n++){
                path_delete(outline_list[| n]);
                }
            }
        }
    ds_list_destroy(outline_list);
    
    instance_destroy();
    }
