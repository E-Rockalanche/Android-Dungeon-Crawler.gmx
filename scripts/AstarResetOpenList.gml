var priority = argument0;

while(ds_priority_size(priority) > 0){
    var cell = ds_priority_delete_min(priority);
    
    /*
    cell.G = 0;
    cell.H = 0;
    cell.F = 0;
    */
    
    cell.open = false;
    cell.closed = false;
    }
    
ds_priority_destroy(priority);
