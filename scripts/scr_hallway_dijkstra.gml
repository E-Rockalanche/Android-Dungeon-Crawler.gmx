//find cells in tight hallway

show_debug_message("Scanning hallway dijkstra");

var hallway_list = ds_list_create();
for(var i = 1; i < width-1; i++){
    for(var j = 1; j < height-1; j++){
        var cell = map[# i,j];
        if (cell.in_hallway && !cell.in_room && (cell.tile != TILE.WALL)){
            var wall_count = 0;
            for(var d = 0; d < 8; d++){
                var neighbor = map[# i+dirs[d,0], j+dirs[d,1]];
                wall_count += (neighbor.tile == TILE.WALL);
                }
            if (wall_count >= 4){
                ds_list_add(hallway_list, cell);
                }
            }
        }
    }
MapDijkstraScan(hallway_list, DIJKSTRA.TO_HALLWAY);
