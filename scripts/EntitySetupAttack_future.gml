var entity = argument0;

show_debug_message("EntitySetupAttack( "+EntityGetName(entity)+" )");

var attack = AttackCreate();
attack[| ATTACK.ENTITY] = entity;
attack[| ATTACK.TARGET] = target;
if (entity.weapon[0] != -1){
    attack[| ATTACK.ITEM] = entity.weapon[0];
    }
ds_list_add(attack_list, attack);

//attack twice if duel wielding
if (entity.weapon[1] != -1){
    attack = AttackCreate();
    attack[| ATTACK.ENTITY] = entity;
    attack[| ATTACK.TARGET] = target;
    attack[| ATTACK.ITEM] = entity.weapon[1];
    ds_list_add(attack_list, attack);
    }

entity.action = ENTITY_ACTION.ATTACK;
