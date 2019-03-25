for(var n = 0; n < ds_list_size(button_list); n++){
    var button = button_list[| n];
    if button[? BUTTON.ENABLED]{
        var left = surf_x + button[? BUTTON.X]*scale;
        var top = surf_y + button[? BUTTON.Y]*scale;
        var width = button[? BUTTON.WIDTH]*scale;
        var height = button[? BUTTON.HEIGHT]*scale;
        if MouseRawInBox(0, left, top, width, height){
            return button;
            }
        }
    }
return -1;
