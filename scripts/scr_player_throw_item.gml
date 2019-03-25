
if MouseClicked(0){
    if MouseInBoundry(0, 0, 0, map_width*GRID_SIZE, map_height*GRID_SIZE){
        var cell = map[# device_mouse_x(0) div GRID_SIZE, device_mouse_y(0) div GRID_SIZE];
        if (cell.discovered || cell.magic_mapped){
            //throw item
            EntityThrow(player, throw_item, cell);
            }
        }
    }
