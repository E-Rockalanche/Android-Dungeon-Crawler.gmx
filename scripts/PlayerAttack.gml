var target = argument0;

show_debug_message("Player is attacking "+EntityGetName(target));

player.target = target;
game_state = GAME_STATE.PLAYER_ATTACKING;
player.action = ENTITY_ACTION.ATTACKING;
alarm[STATE_ALARM] = MOVE_TIME;
