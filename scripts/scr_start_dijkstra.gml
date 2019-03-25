//find cells in tight hallway

show_debug_message("Scanning start dijkstra");

var start_list = ds_list_create();
if (stairs_up != -1){
    ds_list_add(start_list, stairs_up);
    }

MapDijkstraScan(start_list, DIJKSTRA.TO_START);
