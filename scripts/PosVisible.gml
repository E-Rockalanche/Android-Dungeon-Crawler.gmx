var column, row, shadow_list;//shadow_list_high, shadow_list_low;
column = argument0;
row = argument1;
//shadow_list_high = argument2;
//shadow_list_low = argument3;
shadow_list = argument2;

for(var n = 0; n < ds_list_size(shadow_list); n++){
    //var shadow_high = shadow_list_high[| n];
    //var shadow_low = shadow_list_low[| n];
    var shadow = shadow_list[| n];
    high_slope = shadow[0];
    low_slope = shadow[1];
    if ((row <= high_slope*(column-0.5)-0.5) && (row >= low_slope*(column+0.5)+0.5)){
        return false;
        }
    }  
    
return true;
