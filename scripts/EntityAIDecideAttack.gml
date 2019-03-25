//executes attack by entity at front of attack_list
/*
var entity = argument0;

ASSERT(EntityIsAlive(entity),"Entity dead in EntityDecideAttack()");
ASSERT(EntityIsAlive(entity.target),"Target dead in EntityDecideAttack()");

switch(entity.attack_decision){
    case ATTACK.WEAPON:
        break;
    case ATTACK.THROW:
        break;
    case ATTACK.MAGIC:
        break;
    case ATTACK.WAND:
        break;
    default:
        ASSERT(false, "Unkown attack type in EntityDecideAttack()");
    }
