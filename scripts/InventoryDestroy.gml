//can be used to destroy any list of items

var list = argument0;

for(var n = 0; n < ds_list_size(list); n++){
    ItemDestroy(list[| n]);
    }
    
ds_list_destroy(list);
