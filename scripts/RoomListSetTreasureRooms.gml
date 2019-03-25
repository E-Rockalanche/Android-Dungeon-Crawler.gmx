var room_list = argument0;
var num_trooms = min(argument1, ds_list_size(room_list)-1);

/*
//set random rooms to treasure rooms
var troom_list = ds_list_create();
do{
    var index = irandom(ds_list_size(room_list)-1);
    var rm = room_list[| index];
    if RoomCanBeTreasureRoom(rm){
        RoomSetTreasureRoom(rm);
        ds_list_add(troom_list, rm);
        ds_list_delete(room_list, index);
        }
    }until(ds_list_size(troom_list) == num_trooms);
return troom_list;
*/



//set smallest rooms to treasure rooms
var troom_priority = ds_priority_create();
var troom_list = ds_list_create();

//find potential treasure rooms
for(var n = 0; n < ds_list_size(room_list); n++){
    var rm = room_list[| n];
    if RoomCanBeTreasureRoom(rm){
        ds_priority_add(troom_priority, rm, rm[? ROOM.WIDTH]*rm[? ROOM.HEIGHT]);
        }
    }

//set smallest rooms to treasure rooms
repeat(min(num_trooms, ds_priority_size(troom_priority))){
    var rm = ds_priority_delete_min(troom_priority);
    RoomSetTreasureRoom(rm);
    ds_list_delete_value(room_list, rm);
    ds_list_add(troom_list, rm);
    }
    
ds_priority_destroy(troom_priority);
return troom_list;

