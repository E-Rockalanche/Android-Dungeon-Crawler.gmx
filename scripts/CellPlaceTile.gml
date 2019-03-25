//called by CellSetInView()

var cell = argument0;

if cell.in_view || cell.discovered{
    if ((cell.tile != cell.memory_tile) || (cell.tile_id == -1)){
        if (cell.tile_id != -1){
            tile_delete(cell.tile_id);
            cell.tile_id = -1;
            }
            
        cell.memory_tile = cell.tile;
        
        switch(cell.tile){
            case TILE.WATER:
            case TILE.LAVA:
                tile_add(bkr_water_default, 0, 0, GRID_SIZE, GRID_SIZE, cell.i*GRID_SIZE, cell.j*GRID_SIZE, LAKE_TILE_DEPTH);
                cell.tile_id = tile_add(bkgr_tiles, ((TILE.WATER + cell.img_index) mod 16)*GRID_SIZE, ((TILE.WATER + cell.img_index) div 16)*GRID_SIZE, GRID_SIZE, GRID_SIZE, cell.i*GRID_SIZE, cell.j*GRID_SIZE, TILE_DEPTH);
                break;
            
            default:
                cell.tile_id = tile_add(bkgr_tiles, (cell.tile mod 16)*GRID_SIZE, (cell.tile div 16)*GRID_SIZE, GRID_SIZE, GRID_SIZE, cell.i*GRID_SIZE, cell.j*GRID_SIZE, TILE_DEPTH);
            }
        }
    }
