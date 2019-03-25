//entity will try operations in order:
//
//-attack
//-move towards target
//-move towards target's last known location
//-move randomly

var entity = argument0;

ASSERT(EntityIsAlive(entity),"Entity dead or nonexistant in scr_ai_decide()");

show_debug_message("Entity deciding: "+entity.name);

var confused = EntityHasStatusEffect(entity, STATUS.CONFUSED);

//EntityFindTarget(entity);

var cur_cell = entity.cell;
var target = entity.target;

entity.action = ENTITY_ACTION.UNDECIDED;

if (target != -1){
    if EntityCanSeeTarget(entity){//can see target (only player target right now)
        //attack if target is in range
        if EntityCanAttackTarget(entity){
            EntitySetupAttack(entity);
            exit;
            }
        else if EntityMoveTowardsCell(entity, target.cell){
            //entity will move
            exit;
            }
        }
    }
    
//try something else?

//move using existing path
if !ds_stack_empty(entity.path_stack){
    ds_list_add(will_move_list, entity);
    entity.action = ENTITY_ACTION.WILL_MOVE;
    exit;
    }
    
//wander if no path exists
EntityWander(entity);
