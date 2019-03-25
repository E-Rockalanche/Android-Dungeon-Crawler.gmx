//can be used as long as cells point out a path

var start, goal, path, max_iterations, n, cur_cell;

entity = argument0;
start = entity.cell;
goal = argument1;

show_debug_message("EntityPathConstruct( "+EntityGetName(entity)+" )");

path = entity.path_stack;
cur_cell = goal;

max_iterations = map_width*map_height/2;//there is a problem if the loop iterates this high

n = 0;
//add cells to path from goal to start until start node is found
do{
    ASSERT((cur_cell != -1),"cur_cell == -1 in EntityPathConstruct(), (n = "+string(n)+")");
    
    if (cur_cell == start){
        show_debug_message("Path constructed, length = "+string(ds_stack_size(path)));
        break;
        }
    
    if EntityPosFree(entity, cur_cell.i, cur_cell.j){
        ds_stack_push(path, cur_cell);//add free cell to top of path stack
        }
    else{
        ds_stack_clear(path);//delete path section that comes after entity collision or non-permissable tile type
        }
    cur_cell = cur_cell.parent;//go to next cell in path
    
    ++n;
    }until((n == max_iterations));
    
ASSERT((n < max_iterations), "Path could not be traced from goal to start within loop iteration maximum");
