var cell = argument0;
if cell.on_fire{
    cell.on_fire = false;
    
    var update_view = false;
    if (cell.obstructs_view && cell.in_view){
        upate_view = true;
        }
    
    if cell.flamable{
        CellSetTile(cell, TILE.RUBBLE);
        }
    
    if update_view{
        scr_update_player_view();
        }
    
    ds_list_delete_value(fire_list, cell);
    }
