var entity = argument0;

ASSERT((entity.target != -1), "No target in EntityTargetInRange()");

return ((CellDistance(entity.cell,entity.target.cell) <= 1));
