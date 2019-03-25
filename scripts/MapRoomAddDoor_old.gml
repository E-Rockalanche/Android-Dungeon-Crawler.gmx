var new_map = argument[0];
var rm = argument[1];

show_debug_message("MapRoomAddDoor( "+string(rm)+" )");

var map_width = ds_grid_width(new_map);
var map_height = ds_grid_height(new_map);

var left = rm[? ROOM.LEFT];
var top = rm[? ROOM.TOP];
var right = left + rm[? ROOM.WIDTH];
var bottom = top + rm[? ROOM.HEIGHT];

var door_list = rm[? ROOM.DOORS];

var max_tries = 100;
var it = 0;

var ok, cell;
do{
    ok = false;
    var i0, j0, ilength, jlength;
    ilength = 0;
    jlength = 0;
    switch(irandom(4 - 1)){
        case 0://top
            if (rm[? ROOM.TOP] <= 1){
                show_debug_message("cannot create door at bound_top");
                continue;
                }
            show_debug_message("room can create door at bound_top");
            i0 = rm[? ROOM.LEFT]+1;
            j0 = rm[? ROOM.TOP];
            ilength = rm[? ROOM.width]-3;
        break;
        case 1://bottom
            if (rm[? ROOM.j] + rm[? ROOM.height] >= map_height - 1){
                show_debug_message("cannot create door at bottom");
                continue;
                }
            show_debug_message("room "+string(rm[? ROOM.index])+" can create door at bottom");
            i0 = rm[? ROOM.i]+1;
            j0 = rm[? ROOM.j]+rm[? ROOM.height]-1;
            ilength = rm[? ROOM.width]-3;
        break;
        case 2://left
            if (rm[? ROOM.i] <= bound_left+1){
                show_debug_message("cannot create door at bound_left");
                continue;
                }
            show_debug_message("room "+string(rm[? ROOM.index])+" can create door at bound_left");
            i0 = rm[? ROOM.i];
            j0 = rm[? ROOM.j]+1;
            jlength = rm[? ROOM.height]-3;
        break;
        case 3://right
            if (rm[? ROOM.i]+rm[? ROOM.width] >= bound_left+bound_width-1){
                show_debug_message("cannot create door at right");
                continue;
                }
            show_debug_message("room "+string(rm[? ROOM.index])+" can create door at right");
            i0 = rm[? ROOM.i]+rm[? ROOM.width]-1;
            j0 = rm[? ROOM.j]+1;
            jlength = rm[? ROOM.height]-3;
        break;
        }
            
    ok = true;
    var create_i = i0+irandom(ilength);
    var create_j = j0+irandom(jlength);
    show_debug_message("room "+string(rm[? ROOM.index])+" trying to create door at pos: ("+string(create_i)+","+string(create_j)+")");
    
    cell = map[# create_i,create_j];
    for(var n = 0; n < ds_list_size(door_list); n++){
        var door = door_list[| n];
        if (CellDistance(cell, door) <= 1){
            ok = false;
            break;
            }
        }
    
    it++;
    }until(ok || (it == max_tries));

ASSERT(it < max_tries, "Could not find a cell for a door");
    
//door was added
cell[| CELL.TILE] = TILE.DOOR_CLOSED;
ds_list_add(door_list, cell);
return true;
