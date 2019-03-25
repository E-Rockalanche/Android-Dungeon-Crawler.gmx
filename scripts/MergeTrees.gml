//merges trees by adding all rooms in tree2 to tree1

var tree1 = argument0;
var tree2 = argument1;

ASSERT(tree1 != tree2, "tryin to merge a tree into itself");

for(var n = 0; n < ds_list_size(tree2); n++){
    var rm = tree2[| n];
    rm[? ROOM.TREE] = tree1;
    ds_list_add(tree1, rm);
    }
ds_list_destroy(tree2);
