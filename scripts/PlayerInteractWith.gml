var thing = argument0;
var type = argument1;

switch(type){
    case INTERACT.ENTITY:
        if (CellDistance(player.cell, thing.cell) == 1){
            if (thing.alliance >= ALLIANCE.GOOD_ENEMY){
                PlayerAttack(thing);
                }
            else{
                //PlayerTalkWithNPC(thing);
                }
            }
        break;
    case INTERACT.OBJECT:
        break;
    case INTERACT.ITEM:
        EntityPickUpItem(player);
        break;
    case INTERACT.CELL:
        switch(thing[| CELL.TILE]){
            case TILE.STAIRS_DOWN:
            case TILE.STAIRS_UP:
                PlayerUseStairs();
                break;
            }
        break;
    default:
        ASSERT(false, "ERROR: Unknown thing in PlayerInteractWith()");
        break;
    }
