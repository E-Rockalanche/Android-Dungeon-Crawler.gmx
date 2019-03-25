//moves entity to new position
//function is called before moving animation
//returns whether entity was able to move or not

var entity = argument0;
var size = entity.size;

show_debug_message("EntityMove( "+EntityGetName(entity)+" )");

ASSERT(ds_stack_size(entity.path_stack) > 0, "no path for entity "+EntityGetName(entity))

var cell = ds_stack_pop(entity.path_stack);
var old_cell = entity.cell;
    
//interact with leaving cell
if (size == 1){
    switch(old_cell.tile){
        case TILE.DOOR_OPEN:
            if (!EntityIsEnemy(entity)){//only allies will close doors
                CellSetTile(old_cell, TILE.DOOR_CLOSED);
                if old_cell.in_view{
                    update_player_view = true;
                    }
                }
            break;
        }
    }
    
//remove from old cell
for(var n = 0; n < size*size; n++){
    var i = entity.i + (n mod size);
    var j = entity.j + (n div size);
    var cur_cell = map[# i,j];
    cur_cell.entity = -1;
    }
entity.old_i = entity.i;
entity.old_j = entity.j;

//set to new cell
entity.i = cell.i;
entity.j = cell.j;
entity.current_direction = point_direction(entity.old_i, entity.old_j, cell.i, cell.j);
entity.cell = cell;
var in_view = false;
for(var n = 0; n < size*size; n++){
    var i = entity.i + (n mod size);
    var j = entity.j + (n div size);
    var cur_cell = map[# i,j];
    cur_cell.entity = entity;
    if cur_cell.in_view{
        in_view = true;
        }
    }

if (entity != player){
    EntitySetVisible(entity, in_view);
    }

entity.action = ENTITY_ACTION.MOVE;

//sprite
EntitySetSpriteWalk(entity);
var xscale = sign(entity.i - entity.old_i);
if (xscale != 0){
    entity.img_xscale = xscale;
    }

//increase entity cooldown timer

//var stealth_range = EntityGetStealth(entity) + CellGetStealthModifier(cell);
    
//alert enemies in stealth range
//MapAlertStealthRange(map, entity.i, entity.j, stealth_range);

EntityActivateFloor(entity);

EntityAddMoveCooldown(entity);
    
show_debug_message(EntityGetName(entity)+" moved");
