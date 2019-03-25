for(var i = 0; i < map_width; i++){
    for(var j = 0; j < map_height; j++){
        CellSetVisible(map[# i,j]);
        }
    }
    
for(var n = 0; n < ds_list_size(entity_list); n++){
    EntitySetVisible(entity_list[| n]);
    }
    
surface_free(shadow_surf);
