var entity = argument0;

switch(gas_type_grid[# entity.i, entity.j]){
    case GAS.NONE:
        break;
    
    case GAS.HEALING:
        EntityHeal(entity, 1);
        break;
        
    case GAS.TOXIC:
        EntityPoison(entity, 5);
        break;
        
    case GAS.PARALYTIC:
        EntityParalyze(entity, 5);
        break;
        
    case GAS.CONFUSION:
        EntityConfuse(entity, 10);
        break;
        
    default:
        ASSERT(false, "Unknown gas type in EntityBreathGas");
    }
