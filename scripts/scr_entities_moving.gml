for(var n = 0; n < ds_list_size(moving_list); n++){
    var entity = moving_list[| n];
    if entity.in_view{
        var scale = 1 - (game_state_alarm/MOVE_TIME);
        entity.draw_x = floor((entity.old_i + (entity.i - entity.old_i)*scale + entity.size/2)*GRID_SIZE);
        entity.draw_y = floor((entity.old_j + (entity.j - entity.old_j)*scale + entity.size/2)*GRID_SIZE);
        }
    }
