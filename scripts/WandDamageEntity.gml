var wand = argument0;
var target = argument1;

var i = target.i;
var j = target.j;

var wand_type = ItemType(wand);

//var damage = max(0, EntityGetDamage(entity) - EntityGetDefense(target));

EntityTakeDamage(target, 4 + ItemLevel(wand));

switch(wand_type){
    case WAND.FIRE:
        EntitySetOnFire(target);
        break;
        
    case WAND.ICE:
        EntityFreeze(target);
        break;
        
    case WAND.LIGHTNING:
        if (target.size > 1){
            for(var d = 0; d < 8; d++){
                var target = map[# i+dirs[d,0], j+dirs[d,1]];
                EntityTakeDamage(target, 4 + ItemLevel(wand));
                }
            }
        break;
    }
