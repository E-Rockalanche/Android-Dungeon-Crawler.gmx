
show_debug_message("LoadFloor()");
var buf = argument0;

//ID maps
var entity_id = argument1;
var cell_id = argument2;
var item_id = argument3;

show_debug_message("Loading floor");

var cur_floor = instance_create(0,0,obj_floor);
    
instance_activate_object(cur_floor);
with(cur_floor){
    ASSERT(buffer_read(buf, buffer_string) == "floor test", "***ERROR: buffer load is out of sync");
    
    //save variables
    show_debug_message("reading variables");
    initialized = buffer_read(buf, buffer_bool);
    seed = buffer_read(buf, buffer_s32);
    width = buffer_read(buf, buffer_u8);
    height = buffer_read(buf, buffer_u8);
    floor_depth = buffer_read(buf, buffer_u8);
    /*
    initialized = file_text_read_real(fin);
    seed = file_text_read_real(fin);
    width = file_text_read_real(fin);
    height = file_text_read_real(fin);
    floor_depth = file_text_read_real(fin);
    */
    
    if (initialized){
        //load map
        show_debug_message("loading map");
        
        map = ds_grid_create(width, height);
        gas_density_grid = ds_grid_create(width, height);
        gas_type_grid = ds_grid_create(width, height);
        
        for(var i = 0; i < width; i++){
            for(var j = 0; j < height; j++){
                //show_debug_message("Loading cell ("+string(i)+","+string(j)+")");
                var cell = LoadCell(buf, cell_id, item_id);
                map[# i,j] = cell;
                //gas data
                gas_density_grid[# i,j] = buffer_read(buf, buffer_f32);
                gas_type_grid[# i,j] = buffer_read(buf, buffer_u8);
                /*
                gas_density_grid[# i,j] = file_text_read_real(fin);
                gas_type_grid[# i,j] = file_text_read_real(fin);
                */
                }
            }
        
        //load entities (must go after map)
        show_debug_message("loading entities");
        //var esize = file_text_read_real(fin);
        var esize = buffer_read(buf, buffer_u8);
        for(var n = 0; n < esize; n++){
            show_debug_message("Loading entity "+string(n)+" out of "+string(esize));
            ds_list_add(entity_list, LoadEntity(buf, entity_id, cell_id, item_id));
            }
            
        //rebuild item/water/fire/gas lists and exit locations on load
        show_debug_message("rebuilding lists");
        for(var i = 0; i < width; i++){
            for(var j = 0; j < height; j++){
                var cell = map[# i,j];
                
                //translate entity ID
                cell.entity = entity_id[? cell.entity];
                
                if (ds_list_size(cell.items) > 0){
                    ds_list_add(item_list, cell);
                    }
                if (cell.on_fire){
                    ds_list_add(fire_list, cell);
                    }
                if (gas_density_grid[# i,j] > 0){
                    ds_list_add(gas_list, cell);
                    }
                switch(cell.tile){
                    case TILE.STAIRS_DOWN:
                        stairs_down = cell;
                        break;
                    
                    case TILE.STAIRS_UP:
                        stairs_up = cell;
                        break;
                    
                    case TILE.EXIT:
                        dungeon_exit = cell;
                        break;
                    
                    case TILE.WATER:
                        ds_list_add(water_list, cell);
                        break;
                    }
                }
            }
        }
    else{
        show_debug_message("Loaded floor is not initialized");
        }
    }

return cur_floor;
