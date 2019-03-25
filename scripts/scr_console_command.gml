if (game_state == GAME_STATE.PLAYER_TURN){
    if keyboard_check_pressed(ord('C')){
        game_state = GAME_STATE.CONSOLE_COMMAND;
        console_command = "";
        keyboard_key = -1;
        }
    }
else if (game_state == GAME_STATE.CONSOLE_COMMAND){
    if keyboard_check_pressed(vk_enter){
        //execute command
        show_debug_message("----------------------------- Console Command -----------------------------");
        var command = string_lower(CommandGetArgument(console_command));
        show_debug_message("Command: "+command);
        
        var arg = string_lower(CommandGetArgument(string_delete(console_command, 1, string_length(command))));
        show_debug_message("Argument: "+arg);
        
        switch(command){
            case "scanmap":
                switch(arg){
                    case "entities":
                        for(var i = 0; i < map_width; ++i){
                            for(var j = 0; j < map_height; ++j){
                                var str = "map["+string(i)+","+string(j)+"].entity = ";
                                var entity = map[# i,j].entity;
                                if is_undefined(entity){
                                    show_debug_message("***ERROR: " + str + "UNDEFINED");
                                    }
                                else if (entity != -1){
                                    show_debug_message(str + EntityGetName(entity));
                                    }
                                }
                            }
                        break;
                    }
                break;
            
            case "see":
                switch(arg){
                    case "all":
                        debug_see_all = true;
                        break;
                    case "none":
                        debug_see_all = false;
                        break;
                    }
                break;
            
            case "kill":
                switch(arg){
                    case "enemies":
                        var n = 0;
                        while(n < ds_list_size(entity_list)){
                            var entity = entity_list[| n];
                            if (entity.alliance == ALLIANCE.EVIL){
                                EntityDie(entity);
                                }
                            else{
                                ++n;
                                }
                            }
                        break;
                    case "player":
                        EntityDie(player);
                        break;
                    }
                break;
            
            case "view":
                switch(arg){
                    case "all":
                        scr_debug_view_all();
                        break;
                    case "none":
                        scr_debug_view_none();
                        break;
                    }
                break;
            
            case "outlines":
                switch(arg){
                    case "show":
                        show_outlines = true;
                        break;
                    case "hide":
                        show_outlines = false;
                        break;
                    }
                break;
            
            case "info":
                switch(arg){
                    case "show":
                        show_debug_info = true;
                        break;
                    case "hide":
                        show_debug_info = false;
                        break;
                    }
                break;
            
            case "zoomview":
                var zoom = real(arg);
                view_wview = dwidth/zoom;
                view_hview = dheight/zoom;
                break;
            }
        show_debug_message("----------------------------- Finished -----------------------------");
        game_state = GAME_STATE.PLAYER_TURN;
        }
    else if keyboard_check_pressed(vk_backspace){
        keyboard_key = -1;
        console_command = string_copy(console_command, 1, string_length(console_command)-1);
        }
    else if keyboard_check_pressed(vk_anykey){
        //write command
        if (keyboard_key != -1){
            console_command += chr(keyboard_key);
            keyboard_key = -1;
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
