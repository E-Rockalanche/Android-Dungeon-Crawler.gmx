var entity = argument0;

if entity.in_view{
    if (EntityDistance(player, entity) <= EntityGetViewDistance(entity)){
        entity.target = player;
        entity.state = ENTITY_STATE.HUNTING;
        return true;
        }
    }
return false;
