var list = argument0;//list of cells
var d_index = argument1;//what dijkstra scan is this? (enumeration)

//cells in list start with a distance of 0
for(var n = 0; n < ds_list_size(list); n++){
    var cell = list[| n];
    cell.dijkstra[d_index] = 0;
    }

//find distances to 0 value cells for all open cells
var new_list;
while(ds_list_size(list) > 0){
    new_list = ds_list_create();
    for(var n = 0; n < ds_list_size(list); n++){
        var cell = list[| n];
        var i = cell.i;
        var j = cell.j;
        
        ASSERT(PosInBox(i, j, 1, 1, width-1, height-1), "Dijkstra on map border: ("+string(i)+","+string(j)+"), cell"+string(cell)+", tile = "+string(cell.tile));
        
        var value = cell.dijkstra[d_index] + 1;
        for(var d = 0; d < 8; d++){
            var ii = i+dirs[d,0];
            var jj = j+dirs[d,1];
            var neighbour = map[# ii,jj];
            if (neighbour.tile != TILE.WALL){//is_solid is not set yet
                if DiagFree(cell, neighbour){
                    if (neighbour.dijkstra[d_index] > (value)){
                        neighbour.dijkstra[d_index] = value;
                        ds_list_add(new_list, neighbour);
                        }
                    }
                }
            }
        }
    ds_list_destroy(list);
    list = new_list;
    }
ds_list_destroy(list);
