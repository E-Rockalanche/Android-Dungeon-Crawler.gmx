var room1 = argument0;
var room2 = argument1;

var links1 = room1[? ROOM.LINKS];
var links2 = room2[? ROOM.LINKS];

for(var r1 = 0; r1 < ds_list_size(links1); r1++){
    var rm1 = links1[| r1];
    for(var r2 = 0; r2 < ds_list_size(links2); r2++){
        var rm2 = links2[| r2];
        if (rm1 == rm2){
            return true;
            }
        }
    }
    
return false;
