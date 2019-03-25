//general move function
//entity will try to pathfind towards a cell
//returns wether entity will move or not
//
//covers status effects such as confusion

var entity = argument0;
var cell = argument1;

if EntityHasStatusEffect(entity, STATUS.CONFUSED){
    //move randomly
    return EntityMoveRandom(entity);
    }
    
//try straight path
if EntityTryStraightPathTo(entity, cell){
    EntitySetMove(entity);
    return true;
    }

//try to pathfind towards cell
if (entity.size == 1){
    if EntityFindPathToCell(entity, cell){
        EntitySetMove(entity);
        return true;
        }
    }
    
//try to wander towards cell with maximum lateral movement of 90 degrees
if EntityWander(entity, point_direction(entity.i, entity.j, cell.i, cell.j)){
    EntitySetMove(entity);
    return true;
    }
    
//cannot move towards cell
return false;
