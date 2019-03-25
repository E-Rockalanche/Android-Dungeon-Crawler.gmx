for(var i = 1; i < width-1; i++){
    for(var j = 1; j < height-1; j++){
        var cell = map[# i,j];
        if (cell.tile = TILE.WATER){
            ds_list_add(water_list, cell);
            var img_index = 0;
            var index = 1;
            
            for(var d = 0; d < 8; d += 2){
                var ii = i+dirs[d,0];
                var jj = j+dirs[d,1];
                var cur_cell = map[# ii, jj];
                if (BL(cur_cell.tile) & LAKE_STITCHES_TO_TILE){
                    img_index += index;
                    }
                index *= 2;
                }
            
            cell.img_index = img_index;
            }
        }
    }
