//temporary
for(var i = 0; i < map_width; i++){
    for(var j = 0; j < map_height; j++){
        var cell = map[# i,j];
        cell[| CELL.IN_VIEW] = true;
        cell[| CELL.DISCOVERED] = true;
        }
    }
