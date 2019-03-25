var list, value1, value2, index;

list = argument0;
value1 = argument1;
value2 = argument2;

index = ds_list_find_index(list, value2);

ASSERT(index >= 0, "Value2 of ds_list_add_after() does not exist in list");

ds_list_insert(list, index+1, value1);
