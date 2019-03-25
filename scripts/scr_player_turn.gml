//GUI options
if MouseClicked(0){
    if MouseRawInBox(0, bag_x, bag_y, bag_width, bag_height){
        show_debug_message("Opened inventory screen");
    
        player_automove = false;
        game_state = GAME_STATE.INVENTORY;
        scr_sort_player_inventory();
        InventoryWindowOpen(player.inventory, -1, -1, INVENTORY_MODE.ALL, "Bag");
        exit;
        }
    else if MouseRawInBox(0, ss_x, ss_y, ss_width, ss_height) && on_mobile{
        scr_next_shader();
        exit;
        }
    }

//automove
if ((interaction_type != PLAYER_INTERACTION.NONE) && player_automove){
    if PlayerInteract(){
        show_debug_message("PlayerInteract was true");
        player_automove = false;
        }
    else{
        show_debug_message("PlayerInteract was false");
        //move to interaction object/cell
        if (interaction_type == PLAYER_INTERACTION.ENTITY){
            //pathfind to moving target
            if interaction_object.in_view{
                var size = interaction_object.size;
                var cell;
                if (size > 1){
                    var least_dist = INT_MAX;
                    for(var i = 0; i < size; i++){
                        for(var j = 0; j < size; j++){
                            var cur_cell = map[# interaction_object.i + i, interaction_object.j + j];
                            var cur_dist = CellDistance(cur_cell, player.cell);
                            if (cur_dist < least_dist){
                                cell = cur_cell;
                                least_dist = cur_dist;
                                }
                            }
                        }
                    }
                else{
                    cell = interaction_object.cell;
                    }
                if ((interaction_cell != cell) || (ds_stack_size(player.path_stack) == 0)){
                    PlayerMoveToCell(cell);
                    }
                }
            /*
            else{
                //stop moving if enemy goes out of sight
                player_automove = false;
                ds_stack_clear(player.path_stack);
                }
            */
            }
        
        if (ds_stack_size(player.path_stack) > 0){
            show_debug_message("Player is automoving");
            scr_player_move();
            }
        else{
            //interaction failed and there is no path to follow
            player_automove = false;
            }
        }
    }
//choose new action
else if MouseClicked(0){
    if MouseInBoundry(0, 0, 0, map_width*GRID_SIZE, map_height*GRID_SIZE){
        var cell = map[# device_mouse_x(0) div GRID_SIZE, device_mouse_y(0) div GRID_SIZE];
        if ((cell.discovered || cell.magic_mapped) && !cell.is_solid){
            var entity = cell.entity;
            var object = cell.object;
            
            show_debug_message("getting most important aspect of cell");
            
            //get most important aspect of cell
            var cell_priority = ds_priority_create();
            if (entity != -1) && cell.in_view{
                var priority;
                if (entity == player){
                    priority = PLAYER_PRIORITY;
                    }
                else if (EntityIsEnemy(entity)){
                    priority = ENEMY_PRIORITY;
                    }
                else{
                    priority = ALLY_PRIORITY;
                    }
                ds_priority_add(cell_priority, PLAYER_INTERACTION.ENTITY, priority);
                }
            if (object != -1){
                ds_priority_add(cell_priority, PLAYER_INTERACTION.OBJECT, OBJECT_PRIORITY);
                }
            if ((ds_list_size(cell.items) > 0) && !cell.obstructs_view){
                ds_priority_add(cell_priority, PLAYER_INTERACTION.ITEM, ITEM_PRIORITY);
                }
            if CellHasStairs(cell){
                ds_priority_add(cell_priority, PLAYER_INTERACTION.CELL, STAIR_PRIORITY);
                }
            else{
                ds_priority_add(cell_priority, PLAYER_INTERACTION.CELL, CELL_PRIORITY);
                }
                
            show_debug_message("switching cell priority");
            
            switch(ds_priority_find_max(cell_priority)){
                case PLAYER_INTERACTION.ENTITY:
                    show_debug_message("Player to interact with entity "+EntityGetName(entity));
                    interaction_type = PLAYER_INTERACTION.ENTITY;
                    interaction_object = entity;
                    interaction_cell = cell;
                    player_automove = true;
                    ds_stack_clear(player.path_stack);
                    break;
                
                case PLAYER_INTERACTION.OBJECT:
                    show_debug_message("Player to interact with object");
                    interaction_type = PLAYER_INTERACTION.OBJECT;
                    interaction_object = object;
                    PlayerMoveToCell(cell);
                    break;
                
                case PLAYER_INTERACTION.ITEM:
                    show_debug_message("Player to interact with item");
                    interaction_type = PLAYER_INTERACTION.ITEM;
                    PlayerMoveToCell(cell);
                    break;
                
                case PLAYER_INTERACTION.CELL:
                    show_debug_message("Player to interact with cell");
                    interaction_type = PLAYER_INTERACTION.CELL;
                    PlayerMoveToCell(cell);
                    break;
                    
                default:
                    ASSERT(false, "Unknown interaction type in scr_player_turn()");
                    break;
                }
            ds_priority_destroy(cell_priority);
            }
        }
    }
