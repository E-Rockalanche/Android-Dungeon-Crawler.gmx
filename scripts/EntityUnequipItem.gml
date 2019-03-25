var entity = argument0
var item = argument1;

if ItemIsEquipped(item, entity){
    var category = item[? ITEM.CATEGORY];
    
    switch(category){
        case ITEM_CATEGORY.WEAPON:
            if (BL(item[| ITEM.TYPE]) & WEAPON_IS_ONE_HANDED){
                if (entity.weapon[0] == item){
                    entity.weapon[0] = entity.weapon[1];
                    entity.weapon[1] = -1;
                    }
                else{
                    entity.weapon[1] = -1;
                    }
                }
            else{
                entity.weapon[0] = -1;
                entity.weapon[1] = -1;
                }
            break;
        
        case ITEM_CATEGORY.ARMOUR:
            entity.armour = -1;
            break;
        
        case ITEM_CATEGORY.RING:
            if (entity.ring1 == item){
                entity.ring1 = entity.ring2;
                entity.ring2 = -1;
                }
            else{
                entity.ring2 = -1;
                }
            break;
        
        //case ITEM_CATEGORY.WAND:
        //    break;
        }
    return true;
    }
    
//item was not equipped
return false;
