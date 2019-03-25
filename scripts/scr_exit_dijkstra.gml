//find cells in tight hallway

show_debug_message("Scanning exit dijkstra");

var exit_list = ds_list_create();
if (stairs_down != -1){
    ds_list_add(exit_list, stairs_down);
    }

MapDijkstraScan(exit_list, DIJKSTRA.TO_EXIT);
