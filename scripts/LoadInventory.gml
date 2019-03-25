//show_debug_message("LoadInventory()");

var buf = argument0;
var inv = argument1;
var item_id = argument2;

isize = buffer_read(buf, buffer_u8);
//var isize = file_text_read_real(fin);//inventory size

repeat(isize){
    ds_list_add(inv, LoadItem(buf, item_id));
    }
