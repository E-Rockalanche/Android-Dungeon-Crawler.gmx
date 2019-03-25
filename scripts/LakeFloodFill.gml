var lake = argument0;
//returns left, top, width, and height of lake blob

var source_i = argument1;
var source_j = argument2;
var value = argument3;

var dest_value = lake[# source_i, source_j];

var left = source_i;
var top = source_j;
var right = source_i;
var bottom = source_j;

var pos_list = ds_list_create();
ds_list_add(pos_list, Vec2(source_i, source_j));

while(ds_list_size(pos_list) > 0){
    var new_list = ds_list_create();
    var pos = ds_list_delete_return(pos_list, 0);
    var i = pos[0];
    var j = pos[1];
    
    if (lake[# i,j] == dest_value){
        lake[# i,j] = value;
        
        left = min(left, i);
        top = min(top, j);
        right = max(right, i);
        bottom = max(bottom, j);
        
        for(var d = 0; d < 8; d += 2){
            ds_list_add(pos_list, Vec2(i+dirs[d,0], j+dirs[d,1]));
            }
        }
    }
ds_list_destroy(pos_list);

return Vec4(left, top, right-left+1, bottom-top+1);
