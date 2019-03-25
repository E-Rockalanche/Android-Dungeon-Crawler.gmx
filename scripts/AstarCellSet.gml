var cell = argument0;
cell.G = argument1;
cell.H = argument2;
cell.F = argument1+argument2;
cell.parent = argument3;
var o_list = argument4;
var c_list = argument5;

if cell.closed
    {
    ds_list_delete_value(c_list,cell);
    cell.closed = false;
    }
if !cell.open{
    ds_priority_add(o_list, cell, cell.F);
    cell.open = true;
    }
else{
    ds_priority_change_priority(o_list, cell, cell.F);
    }
