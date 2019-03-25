//return amount of sound (tile length) given from action on tile;

var entity = argument0;

var size = entity.size;

for(var n = 0; n < size*size; n++){
    var i = entity.i + (n mod size);
    var j = entity.j + (n div size);
    var cell = map[# i,j];

    switch(cell.tile){
        case TILE.DOOR_CLOSED:
            //open door
            CellSetTile(cell, TILE.DOOR_OPEN);
            if (entity != player){
                update_player_view = true;
                }
        break;
    
        case TILE.TALL_GRASS:
            //trample tall grass
            
            show_debug_message("trampled tall grass");
            
            CellSetTile(cell, TILE.GRASS);
            if (entity != player){
                update_player_view = true;
                }
            break;
        
        case TILE.WATER:
            EntityStopStatusEffect(entity, STATUS.ON_FIRE);
            break;
        
        case TILE.LAVA:
            EntitySetOnFire(entity);
            break;
        
        case TILE.PIT:
            break;
        }
    }
