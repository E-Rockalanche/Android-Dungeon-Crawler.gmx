var cell = argument0;

var tile = cell.tile;

var entity = cell.entity;
if (entity != -1){
    return true;
    }

if (bolt_type == BOLT.ITEM){
    if (cell == to_cell){
        //ALL items stop on target cell
        return true;
        }
    
    if (tile == TILE.TALL_GRASS){
        //only sharp projectiles cut through tall grass
        return ((item_category == ITEM_CATEGORY.PROJECTILE) && (BL(item[? ITEM.TYPE]) & ~PROJECTILE_IS_BLUDGEONING));
        }
    }
else{//wand bolt
    switch(wand_type){
        //wands that stop on target cell
        case WAND.BLINKING:
        case WAND.REGROWTH:
            if (cell == to_cell){
                return true;
                }
            break;
        
        
        default:
            if (tile == TILE.TALL_GRASS){
                //all wands stop at tall grass except fire
                return (wand_type != WAND.FIRE);
                }
            break;
        }
    }
