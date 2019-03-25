show_debug_message("LoadPathStack");

var buf = argument0;
var new_map = argument1;

var stack = ds_stack_create();
var ssize = buffer_read(buf, buffer_u16);
//var ssize = file_text_read_real(fin);

repeat(ssize){
    var jj = buffer_read(buf, buffer_u8);
    var ii = buffer_read(buf, buffer_u8);
    /*
    var jj = file_text_read_real(fin);
    var ii = file_text_read_real(fin);
    */
    ds_stack_push(stack, new_map[# ii,jj]);//floor.map
    }
return stack;
