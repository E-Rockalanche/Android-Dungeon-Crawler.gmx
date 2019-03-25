if (!argument[0]){
    var msg = argument[1];
    show_debug_message(msg);
    if (DEBUG){
        show_message(msg);
        }
    else{
        show_message("FATAL ERROR: "+msg);
        game_end();
        }
    }
