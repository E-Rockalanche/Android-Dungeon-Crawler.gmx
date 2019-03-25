var rm_list = argument0;
for(var n = 0; n < ds_list_size(rm_list); n++){
    RoomDestroy(rm_list[| n]);
    }
ds_list_destroy(rm_list);
