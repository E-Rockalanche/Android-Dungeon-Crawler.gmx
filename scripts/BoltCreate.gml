
game_state = GAME_STATE.ANIMATION;

var bolt = instance_create(0, 0, obj_bolt);
with(bolt){
    caster = argument0;
    to_cell = argument1;
    bolt_type = argument2;
    item = argument3;
    
    current_cell = caster.cell;
    
    if (bolt_type == BOLT.ITEM){
        sprite_index = ItemSprite(item);
        image_index = ItemIndex(item);
        item_category = ItemCategory(item);
        }
    else{//wand
        wand_type = ItemType(item);
        sprite_index = spr_fire;
        image_speed = 1/4;
        }
    
    map = other.map;
        
    i0 = current_cell.i;
    j0 = current_cell.j;
    
    //build path
    i1 = to_cell.i;
    j1 = to_cell.j;
    
    image_rot_dir = sign(i0 - i1);
    if (image_rot_dir == 0){
        image_rot_dir = -1;
        }
    
    var distance = max(abs(i1 - i0), abs(j1 - j0));
    if (distance > 0){
        progress = 0;
        inc = 1/distance;
        var stop = false;
        do{
            progress += inc;
            var pos = LinePos(i0, j0, i1, j1, progress);
            var cur_cell = map[# pos[0], pos[1]];
            
            if BoltCollidesWithCell(cur_cell){
                stop = true;
                }
            else{
                if BoltStopsOnCell(cur_cell){
                    stop = true;
                    }
                ds_queue_enqueue(cell_queue, cur_cell);
                }
            }until(stop);
        }
        
    if (ds_queue_size(cell_queue) > 0){
        //set path
        to_cell = ds_queue_tail(cell_queue);
        
        i1 = to_cell.i;
        j1 = to_cell.j;
        
        progress = 0;
        inc = BOLT_SPEED/(point_distance(i0, j0, i1, j1)*GRID_SIZE);
        cell_time = round(1/inc/max(abs(i1 - i0), abs(j1 - j0)));
        alarm[0] = cell_time;
        }
    else{
        show_debug_message("No path for bolt. Ending now");
        scr_bolt_end();
        }
    }
