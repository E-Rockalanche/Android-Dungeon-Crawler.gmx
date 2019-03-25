var entity = argument0;
entity.action_alarm = sprite_get_number(entity.sprite_attack)/entity.image_speed;
show_debug_message("Set action_alarm to "+string(entity.action_alarm));
