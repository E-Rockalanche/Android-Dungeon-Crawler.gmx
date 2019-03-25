var neighbors = CellGetNeighbors(player.cell);
for(var n = 0; n < ds_list_size(neighbors); n++){
    var cur_cell = neighbors[| n];
    var cur_entity = cur_cell.entity;
    if (cur_entity != -1){
        if EntityIsEnemy(cur_entity){
            if !EntityIsInteractionObject(cur_entity){
                show_debug_message("Enemy by player. player_automove = false");
                player_automove = false;
                break;
                }
            }
        }
    }
ds_list_destroy(neighbors);
