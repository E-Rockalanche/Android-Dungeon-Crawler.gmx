with(instance_create(0, 0, obj_item_window)){
    item = argument0;
    owner = argument1;//window
    
    show_debug_message("ItemWindowOpen( "+ItemGetName(item)+", "+string(owner)+" )");
    
    //description
    info = TextMeasure(ItemGetInfo(item), surf_width - 2*BORDER_WIDTH);
    info_x = BORDER_WIDTH;
    info_y = BORDER_WIDTH + HEADER_HEIGHT + GAP;
    info_height = string_height(info);
    
    //options
    if (owner != -1){
        var xx = BORDER_WIDTH + GAP;
        var yy = info_y + info_height + GAP;
        
        for(var n = 0; n < ITEM_ACTION.LENGTH; n++){
            if ItemHasAction(item, n){
                var button = ItemButtonCreate(xx, yy, OPTION_WIDTH, SLOT_SIZE, item_action_text[n], n);
                ds_list_add(button_list, button);
                xx += OPTION_WIDTH + GAP;
                if (((xx + OPTION_WIDTH + BORDER_WIDTH) > surf_width) && (n < ITEM_ACTION.LENGTH-1)){
                    xx = BORDER_WIDTH + GAP;
                    yy += SLOT_SIZE + GAP;
                    }
                }
            }
        }
        
    surf_height = yy + SLOT_SIZE + GAP + BORDER_WIDTH;
    
    scale = max(1, min(dwidth div surf_width, dheight div surf_height));
    
    surf_x = (dwidth - surf_width*scale)/2;
    surf_y = (dheight - surf_height*scale)/2;
    }
