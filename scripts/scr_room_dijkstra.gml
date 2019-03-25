//find cells in tight hallway

show_debug_message("Scanning room dijkstra");

var room_list = ds_list_create();
for(var i = 1; i < width-1; i++){
    for(var j = 1; j < height-1; j++){
        var cell = map[# i,j];
        if (cell.in_room && !cell.is_solid){
            ds_list_add(room_list, cell);
            }
        }
    }
MapDijkstraScan(room_list, DIJKSTRA.TO_ROOM);
