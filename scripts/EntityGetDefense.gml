var entity = argument0;

var defense = entity.defense;
if (entity.armour != -1){
    defense += ArmourGetDefense(entity.armour);
    }

return defense;
