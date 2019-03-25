var list = argument0;
var index = argument1;

var value = ds_list_find_value(list, index);
ds_list_delete(list, index);

return value;
