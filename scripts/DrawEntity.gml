var entity = argument0;

if (entity.in_view || obj_game.debug_see_all){
    var size = entity.size
    var draw_x = entity.draw_x;
    var draw_y = entity.draw_y;
    
    draw_sprite_ext(entity.sprite_index, floor(entity.img_index), draw_x, draw_y, entity.img_xscale*size, size, 0, c_white, 1);
    
    if EntityHasStatusEffect(entity, STATUS.ON_FIRE){
        draw_sprite_ext(spr_fire, ((step div 4) mod 4), draw_x, draw_y, size, size, 0, c_white, 1);
        }
    }
