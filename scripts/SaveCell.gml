//write cell to buffer

var buf = argument0;
var cell = argument1;

buffer_write(buf, buffer_u32, cell);
//ftwr_space(fout, cell);//save id

instance_activate_object(cell);
with(cell){
    //position
    buffer_write(buf, buffer_u8, i);
    buffer_write(buf, buffer_u8, j);
    /*
    ftwr_space(fout, i);
    ftwr_space(fout, j);
    */
    
    //tile info
    buffer_write(buf, buffer_u8, tile);
    buffer_write(buf, buffer_u8, memory_tile);
    buffer_write(buf, buffer_u8, img_index);
    /*
    ftwr_space(fout, tile);
    ftwr_space(fout, memory_tile);
    //tile_id recreated on load
    ftwr_space(fout, img_index);
    */
    
    //cell info
    //show_debug_message("saving entity: "+string(entity));
    buffer_write(buf, buffer_s32, entity);
    buffer_write(buf, buffer_s32, object);
    buffer_write(buf, buffer_u8, gas);
    buffer_write(buf, buffer_f32, gas_density);
    /*
    ftwr_space(fout, entity);
    ftwr_space(fout, object);
    ftwr_space(fout, gas);
    ftwr_space(fout, gas_density);
    */
    
    SaveInventory(buf, items);
    
    //flags
    buffer_write(buf, buffer_bool, discovered);
    buffer_write(buf, buffer_bool, in_view);
    buffer_write(buf, buffer_bool, was_in_view);
    buffer_write(buf, buffer_bool, magic_mapped);
    buffer_write(buf, buffer_bool, flamable);
    buffer_write(buf, buffer_bool, on_fire);
    buffer_write(buf, buffer_bool, caught_fire_this_turn);
    buffer_write(buf, buffer_bool, frozen);
    buffer_write(buf, buffer_bool, is_trap);
    buffer_write(buf, buffer_bool, is_solid);
    buffer_write(buf, buffer_bool, obstructs_view);
    /*
    ftwr_space(fout, discovered);
    ftwr_space(fout, in_view);
    ftwr_space(fout, was_in_view);
    ftwr_space(fout, magic_mapped);
    ftwr_space(fout, flamable);
    ftwr_space(fout, on_fire);
    ftwr_space(fout, caught_fire_this_turn);
    ftwr_space(fout, frozen);
    ftwr_space(fout, is_trap);
    ftwr_space(fout, is_solid);
    ftwr_space(fout, obstructs_view);
    */
    
    //Astar variables do not need to be saved
    
    //Dungeon generator variables do not need to be saved
    
    SaveArray(buf, dijkstra, DIJKSTRA.LENGTH);
    }
instance_deactivate_object(cell);
