var buf = argument0;
var item = argument1;

buffer_write(buf, buffer_s32, item);
//ftwr_space(fout, item);//save id

instance_activate_object(item);
with(item){
    buffer_write(buf, buffer_u8, depth_found);
    buffer_write(buf, buffer_u16, quantity);
    buffer_write(buf, buffer_u8, category);
    buffer_write(buf, buffer_bool, identified);
    buffer_write(buf, buffer_u8, type);
    buffer_write(buf, buffer_u8, enchantment);
    buffer_write(buf, buffer_u8, level);
    buffer_write(buf, buffer_u8, charges);
    buffer_write(buf, buffer_u32, sprite);
    buffer_write(buf, buffer_u8, img_index);
    /*
    ftwr_space(fout, depth_found);
    ftwr_space(fout, quantity);
    ftwr_space(fout, category);
    ftwr_space(fout, identified);
    ftwr_space(fout, type);
    ftwr_space(fout, enchantment);
    ftwr_space(fout, level);
    ftwr_space(fout, charges);
    ftwr_space(fout, sprite);
    ftwr_space(fout, img_index);
    */
    }
instance_deactivate_object(item);
