var window = argument0;
with(window){
    if (button_list != -1){
        for(var n = 0; n < ds_list_size(button_list); n++){
            ButtonDestroy(button_list[| n]);
            }
        ds_list_destroy(button_list);
        }
    
    instance_destroy();
    }
