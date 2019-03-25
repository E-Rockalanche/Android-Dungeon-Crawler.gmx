with(instance_create(0, 0, obj_inventory_window)){
    inventory = argument0;
    listener = argument1;
    listener_type = argument2;//entity, object, game, etc
    mode = argument3;
    title = argument4;
    
    show_debug_message("InventoryWindowOpen( "+string(inventory)+", "+string(listener)+", "+string(listener_type)+", "+string(mode)+", "+title +" )");
    
    //place buttons
    for(var n = 0; n < ds_list_size(inventory); n++){
        var item = inventory[| n];
        var xx = BORDER_WIDTH + (n mod columns)*SLOT_SIZE
        var yy = BORDER_WIDTH + HEADER_HEIGHT + (n div columns)*SLOT_SIZE
        var button = InventoryButtonCreate(xx, yy, SLOT_SIZE, SLOT_SIZE, inventory[| n]);
        InventoryButtonEnable(button, mode);
        ds_list_add(button_list, button);
        }
    }
