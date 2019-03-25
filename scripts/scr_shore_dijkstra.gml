//find cells in tight hallway

show_debug_message("Scanning shore dijkstra");

var list = ds_list_create();
for(var i = 1; i < width-1; i++){
    for(var j = 1; j < height-1; j++){
        var cell = map[# i,j];
        if (BL(cell.tile) & TILE_IS_GROUND){
            ds_list_add(list, cell);
            }
        }
    }
MapDijkstraScan(list, DIJKSTRA.TO_SHORE);
