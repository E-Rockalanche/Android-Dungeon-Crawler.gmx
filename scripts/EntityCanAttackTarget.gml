var entity = argument[0]
var target;
if (argument_count > 1){
    target = argument[1];
    }
else{
    target = entity.target;
    }
    
ASSERT(target != -1, "No target in EntityAttackTarget()");

if (EntityDistance(entity, target) == 1){
    var size1 = entity.size;
    var size2 = target.size;
    for(var n1 = 0; n1 < size1*size1; n1++){
        var i1 = entity.i + (n1 mod size1);
        var j1 = entity.j + (n1 div size1);
        for(var n2 = 0; n2 < size2*size2; n2++){
            var i2 = target.i + (n2 mod size2);
            var j2 = target.j + (n2 div size2);
            if (PositionDistance(i1, j1, i2, j2) == 1){
                var cell1 = map[# i1,j1];
                var cell2 = map[# i2,j2];
                if entity.permissions[cell2.tile]{
                    if EntityDiagFree(entity, cell1, cell2){
                        return true;
                        }
                    }
                }
            }
        }
    }

return false;
