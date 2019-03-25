//this function should only be used for single time events as it has to build a list of every available tile
//if a random tile must be returned multiple times, just use MapBuildTileList() and ds_list_shuffle(), then pick off the top of the list

var map = argument0;
var tile = argument1;

var list = MapBuildTileList(map, tile);
    
var to_return = ds_list_get_random(list);

ds_list_destroy(list);

return to_return;
