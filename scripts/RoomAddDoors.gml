var rm = argument[0];

var num_doors = 1;
if (argument_count > 1){
    num_doors = argument[1];
    }

show_debug_message("MapRoomAddDoor( "+string(rm)+", "+string(num_doors)+" )");

var left = rm[? ROOM.LEFT];
var top = rm[? ROOM.TOP];
var right = left + rm[? ROOM.WIDTH]-1;
var bottom = top + rm[? ROOM.HEIGHT]-1;

var wall_list = ds_list_create();

//find possible door cells
for(var i = max(2, left); i <= min(width-3, right); i++){
    for(var j = max(2, top); j <= min(height-3, bottom); j++){
        if ((i == left) || (i == right) || (j == top) || (j == bottom)){
            var cell = map[# i,j];
            if (cell.tile == TILE.WALL){
                if (cell.in_room){
                    ds_list_add(wall_list, cell);
                    }
                }
            }
        }
    }
    
//place doors
repeat(num_doors){
    var cell = ds_list_delete_return(wall_list, irandom(ds_list_size(wall_list))-1);
    CellSetTileTemp(cell, TILE.DOOR_CLOSED);
    }
    
ds_list_destroy(wall_list);
