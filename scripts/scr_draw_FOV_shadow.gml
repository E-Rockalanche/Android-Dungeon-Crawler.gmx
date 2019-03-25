var surf_width = map_width+2;
var surf_height = map_height+2;

if !surface_exists(shadow_surf){
    
    //draw view shadow
    shadow_surf = surface_create(surf_width, surf_height);
    
    surface_set_target(shadow_surf);
    draw_clear_alpha(c_black, 1);
    draw_set_blend_mode(bm_subtract);
    draw_set_alpha(0.5);
    
    for(var i = 1; i < map_width+1; i++){
        for(var j = 1; j < map_height+1; j++){
            var cell = map[# i-1, j-1];
            
            if cell.in_view{
                draw_set_alpha(1);
                draw_point_colour(i, j, c_white);
                draw_set_alpha(0.5);
                }
            else if cell.discovered{
                draw_point_colour(i, j, c_white);
                }
            else if cell.magic_mapped{
                draw_point_colour(i, j, c_blue);
                }
            }
        }
    
    surface_reset_target();
    draw_set_blend_mode(bm_normal);
    }

var x_correct = 0;//0.5*(surface_get_width(shadow_surf)/window_get_width() - 1);
var y_correct = 0;//0.5*(surface_get_height(shadow_surf)/window_get_height() - 1);

shader_set(shader_FOV_shadow);
shader_set_uniform_f(shadow_blur_size, surf_width*GRID_SIZE, surf_height*GRID_SIZE, GRID_SIZE/4);
draw_surface_ext(shadow_surf, -GRID_SIZE + x_correct, -GRID_SIZE + y_correct, GRID_SIZE, GRID_SIZE, 0, c_white, 1);
shader_reset();
