var entity = argument0;
var target = argument1;

//check if attack hits
if EntityHitsTarget(entity, target){
    var damage = EntityStrength(entity);
    var weapon = EntityWeapon(entity);
    if (weapon != -1){
        damage += WeaponGetDamage(weapon);
        }
    else{
        damage += EntityGetUnarmedDamage(entity);
        }
        
    var defense = EntityGetDefense(target);
    //lower defense for blunt weapon
    
    //weaknesses & resistances
    
    damage = max(0, damage - defense);
    
    EntityTakeDamage(target, damage);
    }
else{
    //miss
    SplashMiss(target.i, target.j);
    }
