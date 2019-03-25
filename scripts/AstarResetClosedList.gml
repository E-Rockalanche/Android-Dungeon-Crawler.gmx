var list = argument0;

for(var n = 0; n < ds_list_size(list); ++n){
    var cell = list[| n];
    
    /*
    cell.G = 0;
    cell.H = 0;
    cell.F = 0;
    */
    
    cell.open = false;
    cell.closed = false;
    }
    
ds_list_destroy(list);
