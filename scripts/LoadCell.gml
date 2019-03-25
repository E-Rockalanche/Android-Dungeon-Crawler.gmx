var buf = argument0;
var cell_id = argument1;
var item_id = argument2;

var cell = instance_create(0,0,obj_cell);
cell_id[? buffer_read(buf, buffer_u32)] = cell;
//cell_id[? file_text_read_real(fin)] = cell;


with(cell){
    //position
    i = buffer_read(buf, buffer_u8);
    j = buffer_read(buf, buffer_u8);
    /*
    i = file_text_read_real(fin);
    j = file_text_read_real(fin);
    */
    
    //tile info
    tile = buffer_read(buf, buffer_u8);
    memory_tile = buffer_read(buf, buffer_u8);
    img_index = buffer_read(buf, buffer_u8);
    /*
    tile = file_text_read_real(fin);
    memory_tile = file_text_read_real(fin);
    //tile_id recreated on load
    img_index = file_text_read_real(fin);
    */
    
    //cell info
    entity = buffer_read(buf, buffer_s32);
    object = buffer_read(buf, buffer_s32);
    gas = buffer_read(buf, buffer_u8);
    gas_density = buffer_read(buf, buffer_f32);
    /*
    entity = file_text_read_real(fin);
    object = file_text_read_real(fin);
    gas = file_text_read_real(fin);
    gas_density = file_text_read_real(fin);
    */
    
    LoadInventory(buf, items, item_id);
    
    //flags
    discovered = buffer_read(buf, buffer_bool);
    in_view = buffer_read(buf, buffer_bool);
    was_in_view = buffer_read(buf, buffer_bool);
    magic_mapped = buffer_read(buf, buffer_bool);
    flamable = buffer_read(buf, buffer_bool);
    on_fire = buffer_read(buf, buffer_bool);
    caught_fire_this_turn = buffer_read(buf, buffer_bool);
    frozen = buffer_read(buf, buffer_bool);
    is_trap = buffer_read(buf, buffer_bool);
    is_solid = buffer_read(buf, buffer_bool);
    obstructs_view = buffer_read(buf, buffer_bool);
    /*
    discovered = file_text_read_real(fin);
    in_view = file_text_read_real(fin);
    was_in_view = file_text_read_real(fin);
    magic_mapped = file_text_read_real(fin);
    flamable = file_text_read_real(fin);
    on_fire = file_text_read_real(fin);
    caught_fire_this_turn = file_text_read_real(fin, );
    frozen = file_text_read_real(fin);
    is_trap = file_text_read_real(fin);
    is_solid = file_text_read_real(fin);
    obstructs_view = file_text_read_real(fin);
    */
    
    //Astar variables do not need to be saved
    
    //Dungeon generator variables do not need to be saved
    
    dijkstra = LoadArray(buf, DIJKSTRA.LENGTH);
    }
instance_deactivate_object(cell);
return cell;
