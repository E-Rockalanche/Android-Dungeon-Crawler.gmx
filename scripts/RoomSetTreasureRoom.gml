var rm = argument0;

var left = rm[? ROOM.LEFT];
var top = rm[? ROOM.TOP];
var right = left + rm[? ROOM.WIDTH];
var bottom = top + rm[? ROOM.HEIGHT];

rm[? ROOM.TREASURE_ROOM] = true;
TreasureRoomGenerateLock(rm);

for(var i = left; i < right; i++){
    for(var j = top; j < bottom; j++){
        var cell = map[# i,j];
        if cell.in_room{
            cell.in_treasure_room = true;
            CellSetTileTemp(cell, TILE.RUBBLE)//test
            }
        else if cell.is_room_border{
            cell.permanent = true;
            cell.in_treasure_room = true;
            }
        }
    }
