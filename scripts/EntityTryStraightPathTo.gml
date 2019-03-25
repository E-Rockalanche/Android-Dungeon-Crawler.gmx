var entity = argument0;
var goal = argument1;

var start = entity.cell;
var path = entity.path_stack;
ds_stack_clear(path);

var inc = 1/CellDistance(start, goal);

var last_cell = start;
var temp_stack = ds_stack_create();
for(var prog = inc; prog <= 1; prog += inc){
    var pos = LinePos(start.i, start.j, goal.i, goal.j, prog);
    var cell = map[# pos[0], pos[1]];
    
    var on_goal = (cell == goal);
    if ((!on_goal) && (entity.size > 1)){
        for(var i = 0; i < entity.size; i++){
            for(var j = 0; j < entity.size; j++){
                if (map[# i+pos[0], j+pos[1]] == goal){
                    on_goal = true;
                    break;
                    }
                }
            if (on_goal){
                break;
                }
            }
        }
        
    var diag_free = EntityDiagFree(entity, cell, last_cell);
    
    var permissable = EntityPosFree(entity, cell.i, cell.j);
    
    
    if ((permissable || (on_goal)) && diag_free){
        ds_stack_push(temp_stack, cell);
        }
    else{
        ds_stack_destroy(temp_stack);
        return false;
        }
    last_cell = cell;
    }

//put stack into entity.path_stack
while(ds_stack_size(temp_stack) > 0){
    var cell = ds_stack_pop(temp_stack);
    ds_stack_push(path, cell);
    }
ds_stack_destroy(temp_stack);
return true;
