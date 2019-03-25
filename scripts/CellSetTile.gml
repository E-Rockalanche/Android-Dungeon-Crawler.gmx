var cell = argument[0];
var tile;
if (argument_count > 1){
    tile = argument[1];
    cell.tile = tile;
    }
else{
    tile = cell.tile
    }
    
cell.obstructs_view = (BL(tile) & TILE_OBSTRUCTS_VIEW);
cell.is_solid = (BL(tile) & TILE_IS_SOLID);
cell.flamable = (BL(tile) & TILE_IS_FLAMABLE);
cell.blocks_diagonal = (BL(tile) & TILE_BLOCKS_DIAGONAL);

CellPlaceTile(cell);
