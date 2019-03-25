globalvar ASPECT_RATIO, VIEW_WVIEW, VIEW_HVIEW, dwidth, dheight, HUD_SCALE, on_mobile;

on_mobile = DeviceIsMobile();

if (DEBUG && !on_mobile){
    dwidth = view_wport;
    dheight = view_hport;
    window_set_fullscreen(false);
    }
else{
    window_set_fullscreen(true);
    dwidth = display_get_width();
    dheight = display_get_height();
    view_wport = dwidth;
    view_hport = dheight;
    }

ASPECT_RATIO = dwidth/dheight;

if (ASPECT_RATIO >= 1){
    VIEW_HVIEW = 112;
    VIEW_WVIEW = VIEW_HVIEW*ASPECT_RATIO;
    }
else{
    VIEW_WVIEW = 112;
    VIEW_HVIEW = VIEW_WVIEW/ASPECT_RATIO;
    }
    
HUD_SCALE = round(dwidth/VIEW_WVIEW);
    
view_wview = VIEW_WVIEW;
view_hview = VIEW_HVIEW;
    
display_set_gui_size(dwidth, dheight);

surface_resize(application_surface, dwidth, dheight);

//draw_set_alpha_test(true);
//draw_set_alpha_test_ref_value(32);

//shader_set(shdr_shader);

instance_create(0, 0, obj_main_menu);
