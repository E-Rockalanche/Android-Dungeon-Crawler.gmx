var new_map = argument0;
var floor_list = argument1;
var room_floor_list = argument2;
//treasure room floor list?

//get all floor tiles within rooms (no hallways)
show_debug_message("--- MapGetFloorLists() ---");

for(var i = 1; i < width-1; i++){
    for(var j = 1; j < height-1; j++){
        var cell = new_map[# i,j];
        if (BL(cell.tile) & TILE_IS_GROUND){
            if !cell.in_treasure_room{
                if cell.in_room{
                    ds_list_add(room_floor_list, cell);
                    }
                else{
                    ds_list_add(floor_list, cell);
                    }
                }
            }
        }
    }
ASSERT((ds_list_size(floor_list) > 0), "No cells in floor_list");
ASSERT((ds_list_size(room_floor_list) > 0), "No cells in room_floor_list");
ds_list_shuffle(floor_list);
ds_list_shuffle(room_floor_list);
