//executed by obj_game

var cur_floor = argument0;

if (!cur_floor.initialized){
    //FloorCreateOpenMap(cur_floor);//DEBUG
    //FloorGenerateMaze(cur_floor);
    
    switch(irandom(1)){
        case 0: FloorGenerateDungeon(cur_floor); break;
        case 1: FloorGenerateCave(cur_floor); break;
        case 2: FloorGenerateMaze(cur_floor); break;
        default:
            ASSERT(false, "***Generator does not exist***");
            break;
        }
    
    cur_floor.initialized = true;
    }
else{
    //load map
    
    }

map = cur_floor.map;
scr_set_map_tiles();
scr_reset_animated_tiles();

if (DEBUG){
    outline_list = cur_floor.outline_list;
    }
map_width = cur_floor.width;
map_height = cur_floor.height;

//floor lists
entity_list = cur_floor.entity_list;
item_list = cur_floor.item_list;
object_list = cur_floor.object_list;
fire_list = cur_floor.fire_list;
gas_list = cur_floor.gas_list;

//gas grid
gas_density_grid = cur_floor.gas_density_grid;
gas_type_grid = cur_floor.gas_type_grid;

//add player
var spawn_cell;
if (cur_floor.floor_depth > player_depth){
    if (cur_floor.dungeon_exit != -1){
        spawn_cell = cur_floor.dungeon_exit;
        }
    else{
        spawn_cell = cur_floor.stairs_up;
        }
    }
else{
    spawn_cell = cur_floor.stairs_down;
    }

//remove any entities on the stairs/exit
while(spawn_cell.entity != -1){
    var entity = spawn_cell.entity;
    EntityTeleport(entity);
    }

EntitySetCell(player, spawn_cell);
EntitySetSpriteStand(player);
ds_list_add(entity_list, player);
player.turn_timer = 0;

player_depth = cur_floor.floor_depth;
max_player_depth = max(player_depth, max_player_depth);
player_automove = false;

//set player view
scr_update_player_view();

game_state = GAME_STATE.TURN_START;
map_turn_timer = 1;

ds_list_clear(decide_list);
ds_list_clear(will_move_list);
ds_list_clear(moving_list);
ds_list_clear(action_list);
