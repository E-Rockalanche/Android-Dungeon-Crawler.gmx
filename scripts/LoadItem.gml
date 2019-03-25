show_debug_message("LoadItem()");

var buf = argument0;
var item_id = argument1;

/*
if (buffer_read(buf, buffer_string) == "test"){
    show_debug_message("Passed item test");
}else{
    show_debug_message("***ERROR: item test failed");
    }
*/

var item = instance_create(0,0,obj_item);
item_id[? buffer_read(buf, buffer_s32)] = item;//load id

with(item){
    depth_found = buffer_read(buf, buffer_u8);
    quantity = buffer_read(buf, buffer_u16);
    category = buffer_read(buf, buffer_u8);
    identified = buffer_read(buf, buffer_bool);
    type = buffer_read(buf, buffer_u8);
    enchantment = buffer_read(buf, buffer_u8);
    level = buffer_read(buf, buffer_u8);
    charges = buffer_read(buf, buffer_u8);
    sprite = buffer_read(buf, buffer_u32);
    img_index = buffer_read(buf, buffer_u8);
    /*
    depth_found = file_text_read_real(fin);
    quantity = file_text_read_real(fin);
    category = file_text_read_real(fin);
    identified = file_text_read_real(fin);
    type = file_text_read_real(fin);
    enchantment = file_text_read_real(fin);
    level = file_text_read_real(fin);
    charges = file_text_read_real(fin);
    sprite = file_text_read_real(fin);
    img_index = file_text_read_real(fin);
    */
    }
instance_deactivate_object(item);

return item;
