var new_map = argument0;
var pos_msg = argument1;

var width = ds_grid_width(new_map);
var height = ds_grid_height(new_map);

repeat(10000){
    var i = irandom_range(1, width-2);
    var j = irandom_range(1, height-2);
    var cell = new_map[# i,j];
    if cell[| CELL.PERMANENT]{
        ASSERT(false, "cell ("+string(i)+","+string(j)+") is permanent "+pos_msg);
        break;
        }
    }
