var shadow_list = argument0;
var new_shadow_high = argument1;
var new_shadow_low = argument2;

for(var n = 0; n < ds_list_size(shadow_list); n++){
    var shadow = shadow_list[| n];
    var high_slope = shadow[0];
    var low_slope = shadow[1];
    if ((new_shadow_high >= low_slope) && (new_shadow_low <= high_slope)){
        //shadows are overlapping
        new_shadow_high = max(high_slope, new_shadow_high);
        new_shadow_low = min(low_slope, new_shadow_low);
        ds_list_delete(shadow_list, n);
        n--;
        }
    }
var new_shadow;
new_shadow[1] = new_shadow_low;
new_shadow[0] = new_shadow_high;
ds_list_add(shadow_list,new_shadow);
