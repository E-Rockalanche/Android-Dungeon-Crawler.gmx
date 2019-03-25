var cell = argument0;

//right now there are 3 gen flags to trim

var size = ds_list_size(cell);
repeat(3){
    ds_list_delete(cell, --size);
    }
