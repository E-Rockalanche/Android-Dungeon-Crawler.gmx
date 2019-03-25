for(var i = 0; i < map_width; i++){
    for(var j = 0; j < map_height; j++){
        var cell = map[# i,j];
        cell.in_view = false;
        cell.discovered = false;
        }
    }
    
for(var n = 0; n < ds_list_size(entity_list); n++){
    EntitySetVisible(entity_list[| n]);
    }
    
scr_update_player_view();
