with(argument0){
    for(var n = 0; n < ds_list_size(item_buttons); n++){
        ds_map_destroy(item_buttons[| n]);
        }
    ds_list_destroy(item_buttons);
    
    instance_destroy();
    }
