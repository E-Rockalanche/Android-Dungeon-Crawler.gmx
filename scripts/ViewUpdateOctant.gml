var list, i, j, octant, max_dist, is_player_view, max_column, max_row;

list = argument0;
i = argument1;
j = argument2;
octant = argument3;
max_dist = argument4 + 0.5;
is_player_view = argument5;

max_column = OctantGetMaxColumn(i,j,octant,max_dist);
max_row = OctantGetMaxRow(i,j,octant,max_dist);

var shadow_list = ds_list_create();

for(var column = 1; column <= max_column; column++){
    var some_cell_visible = false;
    for(var row = 0; row <= min(column, max_row); row++){
        if PosVisible(column, row, shadow_list){
            var pos = OctantGetPos(i, j, column, row, octant);
            var cell = map[# pos[0],pos[1]];
            
            if !(is_player_view && cell[| CELL.IN_VIEW]){
                //updated octants will not re-add cells already in the list
                ds_list_add(list, cell);
                }
            
            
            if is_player_view{
                //need this to set corners visible
                //CellSetVisible(cell);
                cell[| CELL.IN_VIEW] = true;
                cell[| CELL.DISCOVERED] = true;
                }
            
            
            some_cell_visible = true;
                
            if (cell[| CELL.OBSTRUCTS_VIEW]){
                //var high_slope = (row+0.5)/(column-0.5);
                
                //increase slope to cover diagonal gaps
                //ex)
                //    
                //  #.<--this cell should not be visible
                //  .#
                // ...
                //@...
                /*
                if (high_slope == 1){
                    high_slope = (row+1.5)/(column-0.5);
                    }
                */
                
                AddShadow(shadow_list, (row+0.5)/(column-0.5), (row-0.5)/(column+0.5));
                }
            }
        else if ((row > 0) && is_player_view){
            //check to see if this is a wall corner that should be visible
            var cell = OctantGetCell(i, j, column, row, octant);
            //if (cell[| CELL.OBSTRUCTS_VIEW]){
            var downleft = OctantGetCell(i, j, column-1, row-1, octant);
            if (downleft[| CELL.IN_VIEW] && !downleft[| CELL.OBSTRUCTS_VIEW]){
                var down = OctantGetCell(i, j, column, row-1, octant);
                if down[| CELL.IN_VIEW]{
                    var left = OctantGetCell(i, j, column-1, row, octant);
                    if left[| CELL.IN_VIEW]{
                        //corner is in view
                        show_debug_message("Wall corner ("+string(cell[| CELL.I])+","+string(cell[| CELL.J])+") is in view");
                        
                        //CellSetVisible(cell);
                        cell[| CELL.IN_VIEW] = true;
                        cell[| CELL.DISCOVERED] = true;
                        
                        ds_list_add(list, cell);
                        some_cell_visible = true;
                        }
                    }
                }
            }
        }
    if !some_cell_visible{
        break;
        }
    }
    
ds_list_destroy(shadow_list);
