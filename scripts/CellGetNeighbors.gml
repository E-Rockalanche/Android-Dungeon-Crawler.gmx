//given central cell, function returns ds_list of open cells 1 space away

//this function assumes the central cell is not on the map border

var list, ci, cj;
central = argument0;//cell to get neighbors from

list = ds_list_create();

ci = central.i;
cj = central.j;

ds_list_add(list,map[# ci+1,cj]);
ds_list_add(list,map[# ci+1,cj-1]);
ds_list_add(list,map[# ci+1,cj+1]);
ds_list_add(list,map[# ci-1,cj]);
ds_list_add(list,map[# ci-1,cj-1]);
ds_list_add(list,map[# ci-1,cj+1]);
ds_list_add(list,map[# ci,cj-1]);
ds_list_add(list,map[# ci,cj+1]);

return list;
