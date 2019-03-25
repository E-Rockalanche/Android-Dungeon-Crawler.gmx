var entity = argument[0];

var weapon = -1;
if (argument_count > 1){
    weapon = argument[1];
    }
else{
    weapon = EntityWeapon(entity);
    }
    
var damage = EntityStrength(entity);
if (weapon != -1){
    //entity is armed
    damage += WeaponGetDamage(weapon);
    }
else{
    //entity is unarmed
    damage += EntityGetUnarmedDamage(entity);
    }
    
return damage;
