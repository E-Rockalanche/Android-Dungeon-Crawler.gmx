if !surface_exists(shadow_surf){

    var imin, jmin, imax, jmax;
    imin = max(0, (view_xview div GRID_SIZE) - 1);
    jmin = max(0, (view_yview div GRID_SIZE) - 1);
    imax = min(map_width-1, ((view_xview+view_wview) div GRID_SIZE) + 1);
    jmax = min(map_height-1, ((view_yview+view_hview) div GRID_SIZE) + 1);
    
    //draw view shadow
    var surf_width = imax - imin + 3;
    var surf_height = jmax - jmin + 3;
    shadow_surf = surface_create(surf_width, surf_height);
    
    surface_set_target(shadow_surf);
    draw_clear_alpha(c_black, 0);
    //draw_set_blend_mode(bm_subtract);
    draw_set_alpha(0.707106781);
    for(var i = imin; i <= imax; i++){
        for(var j = jmin; j <= jmax; j++){
            var cell = map[# i,j];
            var draw_i = i - imin + 1;
            var draw_j = j - jmin + 1;
            /*
            if cell.in_view{
                draw_set_alpha(1);
                draw_point_colour(draw_i,draw_j,c_white);
                draw_set_alpha(0.25);
                }
            */
            if cell.in_view{
                continue;
                }
            else if cell.discovered{
                draw_point_colour(draw_i, draw_j, c_black);
                }
            else if cell.magic_mapped{
                draw_point_colour(draw_i, draw_j, c_blue);
                }
            else{
                draw_set_alpha(1);
                draw_point_colour(draw_i, draw_j, c_black);
                draw_set_alpha(0.707106781);
                }
            }
        }
    surface_reset_target();
    
    //draw_set_blend_mode(bm_normal);
    draw_set_alpha(1);
    }

var x_correct = 0;//0.5*(surface_get_width(shadow_surf)/window_get_width() - 1);
var y_correct = 0;//0.5*(surface_get_height(shadow_surf)/window_get_height() - 1);
texture_set_interpolation(blur_shadow);
draw_surface_ext(shadow_surf, (imin - 1)*GRID_SIZE + x_correct, (jmin - 1)*GRID_SIZE + y_correct, GRID_SIZE, GRID_SIZE, 0, c_white, 1);
texture_set_interpolation(false);
