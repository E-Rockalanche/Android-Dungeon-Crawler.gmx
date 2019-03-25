var cell = argument0;
var tile = cell.tile;

if (bolt_type == BOLT.ITEM){
    if (tile == TILE.TALL_GRASS){
        //cut down tall grass with sharp projectiles
        with(obj_game){
            CellSetTile(cell, TILE.GRASS);
            update_player_view = true;
            }
        //grass splash
        }
    }
else{//wand
    switch(wand_type){
        case WAND.FIRE:
            with(obj_game){
                if cell.flamable{
                    CellSetOnFire(cell);
                    }
                }
            break;
            
        case WAND.ICE:
            with(obj_game){
                CellFreeze(cell);
                }
            break;
        }
    }

if (cell.entity != -1){
    BoltHitEntity(cell.entity);
    
    //scr_bolt_end();<-- projectile will end in step event right now
    }
