var cell = argument0;

var tile = cell.tile;

if (cell.is_solid || (tile == TILE.DOOR_CLOSED)){
    return true;
    }
    
if bolt_type == BOLT.WAND{
    if wand_type == WAND.BLINKING{
        if (cell.entity != -1){
            return true;
            }
        }
    }
    
return false;
