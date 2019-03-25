var rm = argument0;

var left = rm[? ROOM.LEFT];
var top = rm[? ROOM.TOP];
var right = left + rm[? ROOM.WIDTH];
var bottom = top + rm[? ROOM.HEIGHT];

for(var i = left; i < right; i++){
    for(var j = top; j < bottom; j++){
        var cell = map[# i,j];
        if (cell.tile == TILE.WATER){
            return false;
            }
        }
    }
    
return true;
