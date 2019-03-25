var buf = argument0;
var sfloor = argument1;
    
instance_activate_object(sfloor);
with(sfloor){
    buffer_write(buf, buffer_string, "floor test");
    
    //save variables
    show_debug_message("saving floor variables");
    buffer_write(buf, buffer_bool, initialized);
    buffer_write(buf, buffer_s32, seed);
    buffer_write(buf, buffer_u8, width);
    buffer_write(buf, buffer_u8, height);
    buffer_write(buf, buffer_u8, floor_depth);
    
    if (initialized){
        //save map
        show_debug_message("saving cells");
        for(var i = 0; i < width; i++){
            for(var j = 0; j < height; j++){
                //show_debug_message("Saving cell ("+string(i)+","+string(j)+")");
                SaveCell(buf, map[# i, j]);
                //gas data
                buffer_write(buf, buffer_f32, gas_density_grid[# i,j]);
                buffer_write(buf, buffer_u8, gas_type_grid[# i,j]);
                }
            }
        
        //save entities
        instance_activate_object(obj_entity);
        var esize = ds_list_size(entity_list);
        show_debug_message("saving "+string(esize)+" entities");
        buffer_write(buf, buffer_u8, esize);
        for(var n = 0; n < esize; n++){
            SaveEntity(buf, entity_list[| n]);
            }
            
        //can rebuild item/water/fire/gas lists and exit locations on load
        }
    }
return true;
