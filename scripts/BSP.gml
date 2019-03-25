var left, top, width, height, max_size, min_size, sep, cur_list, new_list, min_rooms, max_rooms;

show_debug_message("--- BSP ---");

//Inputs:
left = argument[0];
top = argument[1];
width = argument[2];
height = argument[3];
min_size = max(3, min(argument[4], width, height));
max_size = max(3, min(argument[5], width, height));
min_rooms = max(1, argument[6]);
max_rooms = max(1, argument[7]);

if (argument_count > 8){
    sep = max(1, argument[8]);//seperation between rooms
    }
else{
    sep = 1;
    }

var room_list;
do{
    room_list = ds_list_create();
    
    cur_list = ds_list_create();
    var root = RoomCreate(left,top,width,height);
    ds_list_add(room_list, root);
    ds_list_add(cur_list, root);
    
    while(ds_list_size(cur_list) > 0)
        {
        new_list = ds_list_create();
        
        for(var n = 0; n < ds_list_size(cur_list); n++){
            var cur_room = cur_list[| n];
            var cur_width = cur_room[? ROOM.WIDTH];
            var cur_height = cur_room[? ROOM.HEIGHT];
            
            var can_split_hor = (cur_width >= min_size*2 + sep);
            var can_split_ver = (cur_height >= min_size*2 + sep);
            
            var do_hor;
            var aspect = cur_width/cur_height;
            if (can_split_hor && can_split_ver){
                do_hor = (random(aspect + 1/aspect) < aspect);
                }
            else if (can_split_hor || can_split_ver){
                do_hor = (aspect > 1);
                }
            else{
                continue;
                }
            
            if (do_hor){
                if ((cur_width > max_size) || Chance(50)){
                    //split room horizontally
                    var split_w = irandom_range(min_size, cur_width - (min_size + sep));
                    cur_room[? ROOM.WIDTH] = split_w;
                    var new_room = RoomCreate(cur_room[? ROOM.LEFT] + split_w + sep, cur_room[? ROOM.TOP], cur_width - (split_w + sep), cur_height);
                    
                    ds_list_add(new_list, new_room);
                    ds_list_add(new_list, cur_room);
                    
                    ds_list_add(room_list, new_room);
                    }
                else if ((aspect < 1) && (cur_height > max_size)){
                    //if the other dimension must be split, add back to list
                    ds_list_add(new_list, cur_room);
                    }
                }
            else{
                if ((cur_height > max_size) || Chance(50)){
                    //split room vertically
                    var split_h = irandom_range(min_size, cur_height - (min_size + sep));
                    cur_room[? ROOM.HEIGHT] = split_h;
                    var new_room = RoomCreate(cur_room[? ROOM.LEFT], cur_room[? ROOM.TOP] + split_h + sep, cur_width, cur_height - (split_h + sep));
                    
                    ds_list_add(new_list, new_room);
                    ds_list_add(new_list, cur_room);
                    
                    ds_list_add(room_list, new_room);
                    }
                else if ((aspect > 1) && (cur_width > max_size)){
                    //if the other dimension must be split, add back to list
                    ds_list_add(new_list, cur_room);
                    }
                }
            }
        ds_list_destroy(cur_list);
        cur_list = new_list;
        }
    //end
    ds_list_destroy(cur_list);
    
    
    //remove excess rooms
    var num_rooms = ds_list_size(room_list);
    if (num_rooms > max_rooms){
        ds_list_shuffle(room_list);
        repeat(max(0, num_rooms - max_rooms)){
            RoomDestroy(ds_list_delete_return(room_list, 0));
            }
        num_rooms = max_rooms;
        }
    if (num_rooms < min_rooms){
        RoomListDestroy(room_list);
        }
        
    }until(num_rooms >= min_rooms);
    
show_debug_message("Created "+string(ds_list_size(room_list))+" rooms");

return room_list;
