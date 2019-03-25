
/*
if (player.FOV != -1){
    ds_grid_destroy(player.FOV);
    }
player.FOV = GetFOVMask(player.i, player.j, EntityViewDistance(player));

                                    //WILL NEED TO REWORK LATER!

if (player.status[STATUS.mind_vision] > 0){
    for(var n = 0; n < ds_list_size(entity_list); n++){
        var entity = entity_list[| n];
        if (entity != player){
            var cur_FOV = GetFOVMask(entity.i,entity.j,1);
            for(var i = entity.i-1; i <= entity.i+1; i++){
                for(var j = entity.j-1; j <= entity.j+1; j++){
                    player.FOV[# i,j] = (player.FOV[# i,j] || cur_FOV[# i,j]);
                    }
                }
            ds_grid_destroy(cur_FOV);
            }
        }
    }


//reset view
for(var i = 0; i < map_width; i++)
    {
    for(var j = 0; j < map_height; j++)
        {
        var cur_cell = map[# i,j];
        
        if player.FOV[# i,j]{
            CellSetVisible(cur_cell);
            }
        else if CellHasFlag(cur_cell, CELLFLAGS.in_view){
            //cur_cell[| CK.was_in_view] = true;
            CellRefresh(cur_cell);
            cur_cell[| CK.last_char] = cur_cell[| CK.char];
            cur_cell[| CK.last_tcolour] = cur_cell[| CK.tcolour];
            cur_cell[| CK.last_bcolour] = cur_cell[| CK.bcolour];
            CellUnflag(cur_cell, CELLFLAGS.in_view);
            var entity = cur_cell[| CK.entity];
            if (entity != -1)
                entity.in_view = false;
            }
        //else
        //    cur_cell[| CK.was_in_view] = false;
            
        }
        
    }
    
//GetFOV(player.i,player.j,player.vision_distance);
