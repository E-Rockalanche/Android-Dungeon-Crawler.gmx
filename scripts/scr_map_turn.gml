show_debug_message("----------------------------- scr_map_turn() -----------------------------");

var time = current_time;

//entities set on fire and breath gas inside spread scripts vvv
scr_spread_fire();
scr_spread_gas();
//scr_spread_items_in_water();

show_debug_message("map turn took "+string(current_time - time)+" milliseconds");
