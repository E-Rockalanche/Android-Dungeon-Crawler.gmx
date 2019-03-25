var room1 = argument0;
var room_list = argument1;

least_dist = INT_MAX;

var room2 = -1;
for(var n = 0; n < ds_list_size(room_list); n++){
    var cur_room = room_list[| n];   
    if (cur_room != room1){         
        var cur_dist = RoomDistance(room1, cur_room);
        if (cur_dist < least_dist){
            least_dist = cur_dist;
            room2 = cur_room;
            }
        }
    }
    
return room2;
