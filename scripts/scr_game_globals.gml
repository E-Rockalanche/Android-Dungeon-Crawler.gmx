enum GAME_STATE{
    TURN_START,
    
    PLAYER_TURN,//move, attack, search, or choose below options
    INVENTORY,
    OPTIONS,
    THROW_ITEM,
    USE_WAND,
    LOOK,
    
    AI_TURN,//decision making, no animation
    
    ENTITY_MOVING,
    ENTITY_ATTACKING,
    
    ANIMATION,
    
    PAUSE,
    
    ERROR,
    CONSOLE_COMMAND,
    };
    
globalvar game_state_name;
var n = 0;
game_state_name[n++] = "TURN_START";
game_state_name[n++] = "PLAYER_TURN";
game_state_name[n++] = "INVENTORY";
game_state_name[n++] = "OPTIONS";
game_state_name[n++] = "THROW_ITEM";
game_state_name[n++] = "USE_WAND";
game_state_name[n++] = "LOOK";
game_state_name[n++] = "AI_TURN";
game_state_name[n++] = "ENTITY_MOVING";
game_state_name[n++] = "ENTITY_ATTACKING";
game_state_name[n++] = "ANIMATION";
game_state_name[n++] = "PAUSE";
game_state_name[n++] = "ERROR";
game_state_name[n++] = "CONSOLE_COMMAND";

globalvar dirs;
for(var d = 7; d >= 0; d--){
    dirs[d,1] = round(lengthdir_y(1,d*45));
    dirs[d,0] = round(lengthdir_x(1,d*45));
    }
    
enum PLAYER_INTERACTION{
    NONE,
    CELL,
    ENTITY,
    OBJECT,
    THROW,
    ITEM,
    ZAP,
    }


