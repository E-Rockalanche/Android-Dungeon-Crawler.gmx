//update the player's view

show_debug_message("----------------------------- scr_update_view() -----------------------------");

update_player_view = false;

if surface_exists(shadow_surf){
    surface_free(shadow_surf);
    }

var time = current_time;

//reset last FOV
for(var n = 0; n < ds_list_size(view_list); n++){
    var cell = view_list[| n];
    cell.in_view = false;
    }
ds_list_clear(view_list);

//create new FOV
FOVGetList(view_list, player.i, player.j, EntityGetViewDistance(player), true, (player.cell.tile == TILE.WATER));
ds_list_add(view_list, player.cell);

show_debug_message("Player can see "+string(ds_list_size(view_list))+" cells");

//set cells in FOV to visible
for(var n = 0; n < ds_list_size(view_list); n++){
    CellSetVisible(view_list[| n]);
    }
    
//Find visible entities
for(var n = 0; n < ds_list_size(entity_list); n++){
    var entity = entity_list[| n];
    EntitySetVisible(entity);
    }
    
time = current_time - time
show_debug_message("------ Player FOV took "+string(time)+"ms ------");
