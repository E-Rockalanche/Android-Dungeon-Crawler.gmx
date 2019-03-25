//executed by obj_bolt

var target = argument0;

show_debug_message("Bolt hit "+EntityGetName(target));

var i = current_cell.i;
var j = current_cell.j

switch(bolt_type){
    case BOLT.ITEM:
        switch(ItemCategory(item)){
            case ITEM_CATEGORY.PROJECTILE:
                var damage = max(0, EntityGetDamage(caster, item) - EntityGetDefense(target));
                with(obj_game){
                    EntityTakeDamage(target, damage);
                    }
                ItemDestroy(item);
                item = -1;
                break;
                
            case ITEM_CATEGORY.POTION:
                var damage = max(0, 1 - EntityGetDefense(target));
                with(obj_game){
                    EntityTakeDamage(target, damage);
                    PotionBreak(other.item, i, j);
                    }
                item = -1;
                break;
                
            default:
                break;
            }
        break;
        
    case BOLT.WAND:
        switch(wand_type){
            //non-damaging wands:
            case WAND.TELEPORTATION:
                with(obj_game){
                    EntityTeleport(target);
                    }
                break;
                
            case WAND.DOMINATION:
                break;
                
            case WAND.REGROWTH:
                break;
                
            case WAND.HEALING:
                EntityHeal(target, 4);
                break;
                
            case WAND.LIGHTNING:
                //lightning wands damage all neighbouring entities
                for(var d = 0; d < 8; d++){
                    var cell = map[# i+dirs[d,0], j+dirs[d,1]];
                    if (cell.entity != -1){
                        with(obj_game){
                            WandDamageEntity(other.item, cell.entity);
                            }
                        }
                    }
                //no break
            default:
                //damaging wands
                with(obj_game){
                    WandDamageEntity(other.item, target);
                    }
                break;
            }
        break;
    }
