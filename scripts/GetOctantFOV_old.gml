/*

var i, j, octant, max_dist, mask, max_column, max_row

i = argument[0];
j = argument[1];
octant = argument[2];
max_dist = argument[3];
mask = argument[4];

max_column = OctantGetMaxColumn(i,j,octant,max_dist);
max_row = OctantGetMaxRow(i,j,octant,max_dist);

//var shadow_list_high = ds_list_create();//high slope
//var shadow_list_low = ds_list_create();//low slope
var shadow_list = ds_list_create();

for(var column = 1; column <= max_column; column++){
    var some_cell_visible = false;
    for(var row = 0; row <= min(column,max_row); row++){
        if PosVisible(column, row, shadow_list){//shadow_list_high, shadow_list_low){  
            var pos = OctantGetPos(i,j,column,row,octant);
            var cell = map[# pos[0],pos[1]];
            some_cell_visible = true;
            
            mask[# pos[0], pos[1]] = true;
            //mask[@ cell[| CK.i], cell[| CK.j]] = true;
            //CellSetVisible(cell);
                
            if CellHasFlag(cell, CELLFLAGS.obstructs_view){
                var high_slope = (row+0.5)/(column-0.5);
                if (high_slope == 1)
                    high_slope = (row+1.5)/(column-0.5);
                AddShadow(shadow_list, high_slope, (row-0.5)/(column+0.5));
                }
            }
        }
    if !some_cell_visible
        break;
    }
    
//ds_list_destroy(shadow_list_high);
//ds_list_destroy(shadow_list_low);
ds_list_destroy(shadow_list);
