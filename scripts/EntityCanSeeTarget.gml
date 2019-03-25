//only the player can be a target right now

var entity = argument[0];
var target = entity.target;
if (argument_count > 1){
    target = argument[1];
    }
    
ASSERT(target != -1, "No target in EntityCanSeeTarget()");

var within_view_dist = (EntityDistance(entity, target) <= EntityGetViewDistance(entity));

//player can see entity
if (entity.in_view && within_view_dist){
    return true;
    }
    
//entity
return ((entity.abilities & BL(ABILITY.SPECTRAL_SIGHT)) && within_view_dist);
