//executed by obj_entity
//triggered by an action script

show_debug_message("scr_action_end()");

action_item = -1;
action_target = -1;
action_cell = -1;
action_ability = -1;
action_spell = -1;

EntitySetSpriteStand(id);

obj_game.game_state = GAME_STATE.AI_TURN;
