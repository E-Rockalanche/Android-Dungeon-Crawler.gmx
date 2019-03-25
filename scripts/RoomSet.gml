//set permanent border cells and room center

var rm = argument0;

var rm_left = rm[? ROOM.LEFT];
var rm_top = rm[? ROOM.TOP];
var rm_width = rm[? ROOM.WIDTH];
var rm_height = rm[? ROOM.HEIGHT];

var total_area = 0;

for(var i = 0; i < rm_width; i++){
    for(var j = 0; j < rm_height; j++){
        var cell = map[# rm_left + i, rm_top + j];
        if (cell.permanent){
            continue;
            }
        
        if (cell.tile == TILE.WALL){
            //set coordinate room border
            for(var d = 0; d < 8; d += 2){
                var ii = clamp(i+dirs[d,0], 0, rm_width);
                var jj = clamp(j+dirs[d,1], 0, rm_height);
                var neighbor = map[# rm_left+ii, rm_top+jj];
                if (neighbor.tile == TILE.FLOOR){
                    cell.is_room_border = true;
                    break;
                    }
                }
            if cell.is_room_border{
                continue;
                }
            //set diagonal walls to permanent
            for(var d = 1; d < 8; d += 2){
                var ii = clamp(i+dirs[d,0], 0, rm_width);
                var jj = clamp(j+dirs[d,1], 0, rm_height);
                var neighbor = map[# rm_left+ii, rm_top+jj];
                if (neighbor.tile == TILE.FLOOR){
                    cell.permanent = true;
                    cell.is_room_border = true;
                    break;
                    }
                }
            }
        else if (cell.tile == TILE.FLOOR){
            cell.in_room = true;
            total_area++;
            }
        }
    }
    
if (total_area == 0){
    //room totally covered by a lake
    var ci = rm_left + (rm_width div 2);
    var cj = rm_top + (rm_height div 2);
    for(var i = ci-1; i <= ci+1; i++){
        for(var j = cj-1; j <= cj+1; j++){
            var cell = map[# i,j];
            CellSetTileTemp(cell, TILE.FLOOR);
            cell.in_room = true;
            }
        }
    }
    
RoomSetCenter(rm);
