//can destroy any list of entities

var list = argument0;

for(var n = 0; n < ds_list_size(list); n++){
    EntityDestroy(list[| n]);
    }
ds_list_destroy(list);
