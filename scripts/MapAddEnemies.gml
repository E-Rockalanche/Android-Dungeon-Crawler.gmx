show_debug_message("--- MapAddEnemies() ---");

var new_map = argument0;
var num_enemies = argument1;

repeat(num_enemies){
    var entity, ok, cell, i, j;
    var size = 1;
    do{
        entity = EnemyCreate();
        if Chance(10){
            entity.size = 2;
            size = 2;
            }
        
        var tries = 0;
        do{
            i = irandom_range(1, width-1-size);
            j = irandom_range(1, height-1-size);
            
            ok = true;
            
            for(var n = 0; n < size*size; n++){
                var ii = i + (n mod size);
                var jj = j + (n div size);
                var cur_cell = new_map[# ii,jj];
                if cur_cell.in_view{
                    //enemy cannot be spawned in player's view
                    ok = false;
                    }
                if !entity.permissions[cur_cell.tile]{
                    ok = false;
                    break;
                    }
                var other_entity = cur_cell.entity;
                if (other_entity != -1){
                    ok = false;
                    break;
                    }
                }
            tries++;
            }until(ok || (tries >= 100));
        
        if !ok{
            //maybe there are no permissable tiles for this type of entity?
            EntityDestroy(entity);
            }
        else{
            cell = new_map[# i,j];
            }
        
        }until(ok);
    
    //set to new cell
    entity.i = i;
    entity.j = j;
    entity.cell = cell;
    for(var n = 0; n < size*size; n++){
        var i = entity.i + (n mod size);
        var j = entity.j + (n div size);
        var cur_cell = new_map[# i,j];
        cur_cell.entity = entity;
        }
    EntitySetDrawPos(entity);
    EntitySetSpriteStand(entity);
    
    ds_list_add(entity_list, entity);
    }
