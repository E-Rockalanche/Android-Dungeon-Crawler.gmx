for(var i = 0; i < map_width; i++){
    for(var j = 0; j < map_height; j++){
        var cell = map[# i,j];
        cell.tile_id = -1;
        }
    }
tile_layer_delete(TILE_DEPTH);
tile_layer_delete(LAKE_TILE_DEPTH);
