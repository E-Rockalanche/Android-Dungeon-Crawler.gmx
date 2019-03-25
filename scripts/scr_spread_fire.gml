show_debug_message("scr_spread_fire()");

var time = current_time;

var cur_size = ds_list_size(fire_list);
if (cur_size == 0){
    exit;
    }

//spread fire
for(var n = 0; n < cur_size; ++n){
    var cell = fire_list[| n];
    
    if cell.on_fire{
        //if !cell.caught_fire_this_turn{//do not need if only spreading cur_size number of fire cells
        if (cell.entity != -1){
            EntitySetOnFire(cell.entity);
            }
        
        //spread fire
        for(var d = 0; d < 8; ++d){
            if Chance(33){
                var cur_cell = map[# cell.i+dirs[d,0], cell.j+dirs[d,1]];
                if cur_cell.flamable{
                    if DiagFree(cell, cur_cell){
                        CellSetOnFire(cur_cell);
                        cur_cell.caught_fire_this_turn = true;
                        }
                    }
                }
            }
        //extinguish flaming tile
        if (Chance(10) || !cell.flamable){
            CellExtinguish(cell);
            --cur_size;
            --n;
            }
        }
    else{
        //not supposed to be in fire list
        ds_list_delete(fire_list, n);
        --cur_size;
        --n;
        }
    }

show_debug_message("took "+string(current_time - time)+" milliseconds");
