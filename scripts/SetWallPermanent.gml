//stes a cell to permenent only if it is a wall
//*need for RoomMakeSquare

var cell = argument0;
if (cell.tile == TILE.WALL){
    cell.permenent = true;
    }
