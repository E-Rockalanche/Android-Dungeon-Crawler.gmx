//given central cell, function returns ds_list of open cells 1 space away

//this function check wether the neighbor cells are in the map

var list, ci, cj;
central = argument0;//cell to get neighbors from

list = ds_list_create();

ci = central.i;
cj = central.j;

if (ci < map_width-1){
    ds_list_add(list,map[# ci+1,cj]);
    if (cj > 0){
        ds_list_add(list,map[# ci+1,cj-1]);
        }
    if (cj < map_height-1){
        ds_list_add(list,map[# ci+1,cj+1]);
        }
    }
if (ci > 0){
    ds_list_add(list,map[# ci-1,cj]);
    if (cj > 0){
        ds_list_add(list,map[# ci-1,cj-1]);
        }
    if (cj < map_height-1){
        ds_list_add(list,map[# ci-1,cj+1]);
        }
    }
if (cj > 0){
    ds_list_add(list,map[# ci,cj-1]);
    }
if (cj < map_height-1){
    ds_list_add(list,map[# ci,cj+1]);
    }

return list;
