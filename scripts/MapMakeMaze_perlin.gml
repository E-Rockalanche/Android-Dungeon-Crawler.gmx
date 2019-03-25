show_debug_message("--- MapMakeMaze() ---");

var new_map = argument0;

var floor_list = ds_list_create();
var maze_stack = ds_stack_create();

//find wall cell to start on
var i, j, root;
do{
    i = irandom_range(1, width-2);
    j = irandom_range(1, height-2);
    root = new_map[# i,j];
    }until((root.tile == TILE.WALL) && !root.is_room_border && !root.permanent);

ds_list_add(floor_list, root);
ds_stack_push(maze_stack, root);
CellSetTileTemp(root, TILE.FLOOR);
root.in_hallway = true;

var noise = ds_grid_create(width, height);
PerlinAddNoise(noise, 4, 100, 0);

//var options = ds_list_create();
var options = ds_priority_create();
var cell;
while(ds_stack_size(maze_stack) > 0){
    cell = ds_stack_top(maze_stack);
    var i = cell.i;
    var j = cell.j;
    
    //get options
    for(var d = 0; d < 8; d += 2){
        var ii = i+dirs[d,0];
        var jj = j+dirs[d,1];
        //check if position is in map
        if PosInBoundry(ii, jj, 1, 1, width-2, height-2){
            cell = new_map[# ii, jj];
            var ok = true;
            if cell.permanent{
                continue;
                }
            if (cell.tile != TILE.WALL){
                continue;
                }
            //check for any floor neighbours
            for(var dd = d-2; dd <= d+2; dd++){
                var dir = (dd+8) mod 8;
                var iii = ii+dirs[dir,0];
                var jjj = jj+dirs[dir,1];
                var neighbour = new_map[# iii, jjj];
                if (neighbour.tile == TILE.FLOOR){
                    ok = false;
                    break;
                    }
                }
            if ok{
                ds_priority_add(options, cell, noise[# i+ii, j+jj]);
                }
            }
        }
    
    //choose an options
    //if (ds_list_size(options) > 0){
    if (ds_priority_size(options) > 0){
        //var dir = ds_list_get_random(options);
        cell = ds_priority_delete_min(options);
        
        ds_list_add(floor_list, cell);
        ds_stack_push(maze_stack, cell);
        CellSetTileTemp(cell, TILE.FLOOR);
        cell.in_hallway = true;
        }
    else{
        //go back one cell if there are no options
        ds_stack_pop(maze_stack);
        }
    //ds_list_clear(options);
    ds_priority_clear(options);
    }
//ds_list_destroy(options);
ds_priority_destroy(options);
ds_stack_destroy(maze_stack);

return floor_list;
