var cell = argument0;

show_debug_message("CellRefreshView( "+string(cell.i)+","+string(cell.j)+" )");

if cell.in_view{
    update_view_octant[DirectionGetOctant(point_direction(player.i, player.j, cell.i, cell.j))] = true;
    }
