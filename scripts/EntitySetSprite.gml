/*
var entity = argument0;
switch(entity.state){
    case ENTITY_STATE.DORMANT:
    case ENTITY_STATE.UNACTIVATED:
        EntitySetSpriteWait(entity);
        break;
        
    case ENTITY_STATE.SLEEPING:
        EntitySetSpriteSleeping(entity);
        break;
        
    case ENTITY_STATE.DEAD:
        EntitySetSpriteDead(entity);
        break;
        
    default:
        switch(entity.action){
            case ENTITY_ACTION.WAIT:
                EntitySetSpriteWait(entity);
                break;
            
            case ENTITY_ACTION.MOVING:
                EntitySetSpriteMoving(entity);
                break;
            
            case ENTITY_ACTION.ATTACKING:
                EntitySetSpriteAttacking(entity);
                break;
            }
        break;
    }
