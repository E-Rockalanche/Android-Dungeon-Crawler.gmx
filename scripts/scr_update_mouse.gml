for(var m = 0; m <= 1; m++){
    if (mouse_alarm[m] > -1){
        mouse_alarm[m] = max(-1, mouse_alarm[m] - delta);
        }
        
    mouse_clicked[m] = false;
    
    /*
    mouse_raw_x[m] = device_mouse_raw_x(m);
    mouse_raw_y[m] = device_mouse_raw_y(m);
    
    mouse_cur_x[m] = device_mouse_x(m);
    mouse_cur_y[m] = device_mouse_y(m);
    */
    
    if device_mouse_check_button_pressed(m, mb_left){
        if device_mouse_check_button(!m, mb_left){
            mouse_alarm[0] = -1;
            mouse_alarm[1] = -1;
            mouse_clicked[0] = false;
            mouse_clicked[1] = false;
            mouse_holding[0] = false;
            mouse_holding[1] = false;
            }
        else{
            mouse_alarm[m] = CLICK_TIME;
            }
        
        mouse_click_x[m] = device_mouse_raw_x(m);
        mouse_click_y[m] = device_mouse_raw_y(m);
        
        //use for screen dragging
        mouse_x0[m] = device_mouse_x(m);
        mouse_y0[m] = device_mouse_y(m);
        }
    else if device_mouse_check_button_released(m, mb_left){
        if (mouse_alarm[m] != -1){
            mouse_clicked[m] = true;
            }
        }
        
    if device_mouse_check_button(m, mb_left){
        if !mouse_holding[m]{
            if (point_distance(device_mouse_raw_x(m), device_mouse_raw_y(m), mouse_click_x[m], mouse_click_y[m]) >= MOUSE_HOLD_THRESHOLD){
                mouse_alarm[m] = -1;
                }
            mouse_holding[m] = (mouse_alarm[m] == -1)
            }
        }
    else{
        mouse_holding[m] = false;
        }
    }
    
/*
if mouse_clicked[0]{
    show_debug_message("Mouse0 = ("+string(device_mouse_x(0))+", "+string(device_mouse_y(0))+")");
    show_debug_message("Mouse0 raw = ("+string(device_mouse_raw_x(0))+", "+string(device_mouse_raw_y(0))+")");
    }
*/
