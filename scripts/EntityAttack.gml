//executed by obj_game

var entity = argument[0];
var target;
if (argument_count > 1){
    target = argument[1];
    entity.target = target;
    }
else{
    target = entity.target;
    }
    
ASSERT(target != -1, "No target in EntityAttackStart()");

show_debug_message("EntityAttack( "+EntityGetName(entity)+", "+EntityGetName(target)+" )");

var xscale = sign(target.i - entity.i);
if (xscale != 0){
    entity.img_xscale = xscale;
    }

entity.action = ENTITY_ACTION.ATTACK;
scr_action_start();
EntitySetSpriteAttack(entity);
EntitySetActionAlarm(entity);
