var cell = argument0;

var left = max(1, cell.i-2);
var top = max(1, cell.j-2);
var right = min(width-2, cell.i+2);
var bottom = min(height-2, cell.j+2);

for(var i = left; i <= right; i++){
    for(var j = top; j <= bottom; j++){
        var cur_cell = map[# i,j];
        //its ok to check argument0 for a door
        if (cur_cell.tile == TILE.DOOR_CLOSED){
            cell.tile = TILE.FLOOR;
            return false;
            }
        }
    }
    
cell.tile = TILE.DOOR_CLOSED;
return true;
