var entity = argument0;
var cell = argument1;

show_debug_message("EntitySetCell( "+EntityGetName(entity)+", "+string(cell)+" )");

var size = entity.size;

//set to new cell
entity.i = cell.i;
entity.j = cell.j;
entity.cell = cell;
var in_view = false;
for(var n = 0; n < size*size; n++){
    var i = entity.i + (n mod size);
    var j = entity.j + (n div size);
    var cur_cell = map[# i,j];
    cur_cell.entity = entity;
    if cur_cell.in_view{
        in_view = true;
        }
    }
    
EntitySetDrawPos(entity);

if (entity != player){
    EntitySetVisible(entity, in_view);
    }
