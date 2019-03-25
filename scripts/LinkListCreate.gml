show_debug_message("----------------------------- LinkListCreate() -----------------------------");

var room_list = argument0;//DO NOT DESTROY

var link_list = ds_list_create();
if (ds_list_size(room_list) < 2){
    show_debug_message("Only 1 room. No links needed");
    return link_list;
    }

var tree_list = ds_list_create();

//setup initial trees
//Setting up intial trees
for(var r1 = 0; r1 < ds_list_size(room_list); r1++){
    var room1 = room_list[| r1];
    
    //finding closest to room1
    var room2 = RoomFindClosest(room1, room_list);
        
    //connecting room1 to room2
    var tree1 = room1[? ROOM.TREE];
    var tree2 = room2[? ROOM.TREE];
    if (tree1 != -1){
        //room 1 is in a tree
        if (tree2 != -1){
            if (tree1 == tree2){
                //rooms are already connected
                continue;
                }
            //merging trees
            MergeTrees(tree1, tree2);//destroys tree2
            ds_list_delete_value(tree_list, tree2);
            }
        else{
            //add room2 to tree1
            room2[? ROOM.TREE] = tree1;
            ds_list_add(tree1, room2);
            }
        }
    else{
        if (tree2 != -1){
            //add room1 to tree2
            room1[? ROOM.TREE] = tree2;
            ds_list_add(tree2, room1);
            }
        else{
            //create new tree
            var new_tree = ds_list_create();
            room1[? ROOM.TREE] = new_tree;
            room2[? ROOM.TREE] = new_tree;
            ds_list_add(new_tree, room1, room2);
            ds_list_add(tree_list, new_tree);
            }
        }
        
    //add link
    ds_list_add(link_list, LinkCreate(room1, room2));
    }
    
//connect trees
show_debug_message("----------------------------- Connecting trees -----------------------------");

//tree1 finds the closest tree by iterating through the other trees. Each
//tree iterates through their rooms and find the closest connection
while(ds_list_size(tree_list) > 1){//there must be 2 trees left to merge
    var least_dist = INT_MAX;
    var least_room1;
    var least_room2;
    var tree1 = tree_list[| 0];
    
    //finding closest tree to tree1
    for(var t = 1; t < ds_list_size(tree_list); t++){
        //other tree
        var tree2 = tree_list[| t];
        
        for(var r1 = 0; r1 < ds_list_size(tree1); r1++){
            var room1 = tree1[| r1];
            for(var r2 = 0; r2 < ds_list_size(tree2); r2++){
                var room2 = tree2[| r2];
                var cur_dist = RoomDistance(room1, room2);
                if (cur_dist < least_dist){
                    least_room1 = room1;
                    least_room2 = room2;
                    least_dist = cur_dist;
                    }
                }
            }
        }
        
    var closest_tree = least_room2[? ROOM.TREE];
    //merging tree1 and closest_tree
    MergeTrees(tree1, closest_tree);//destroys tree2
    ds_list_delete_value(tree_list, closest_tree);
    
    //add link
    //adding link between least_room1 and least_room2
    ds_list_add(link_list, LinkCreate(least_room1, least_room2));
    }
    
//check to make sure all rooms are in the same tree
var master_tree = tree_list[| 0];
for(var n = 0; n < ds_list_size(room_list); n++){
    var rm = room_list[| n];
    ASSERT(rm[? ROOM.TREE] == master_tree, "room "+string(rm)+" is not in the completed tree");
    }
    
ds_list_destroy(master_tree);
ds_list_destroy(tree_list);

ASSERT(ds_list_size(link_list) == ds_list_size(room_list)-1, "not enough links to connect rooms");

//create loops
show_debug_message("----------------------------- Creating loops -----------------------------");
//ds_list_shuffle(room_list);
for(var r1 = 0; r1 < ds_list_size(room_list)-1; r1++){
    var room1 = room_list[| r1];
    var links1 = room1[? ROOM.LINKS];
    var num_links1 = ds_list_size(links1);
    if (num_links1 <= 2){
        for(var r2 = r1+1; r2 < ds_list_size(room_list); r2++){
            var room2 = room_list[| r2];
            if !RoomsShareLink(room1, room2){
                var links2 = room2[? ROOM.LINKS];
                var num_links2 = ds_list_size(links2);
                if (num_links2 <= 2){
                    if Chance(100*(1 - 0.7*((num_links1 > 1) + (num_links2 > 1)))){
                        //add link
                        //adding link between room1 and room2
                        
                        //ds_list_add(link_list, LinkCreate(room1, room2));
                        
                        //create unnoficial link. Rooms will not remember these links
                        var link = ds_map_create();
                        link[? 0] = room1;
                        link[? 1] = room2;
                        ds_list_add(link_list, link);
                        
                        }
                    }
                }
            }
        }
    }

show_debug_message("----------------------------- Link list complete -----------------------------");

return link_list;
