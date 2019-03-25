//executed by obj_entity

show_debug_message("scr_entity_attack()");

//check if attack hits
if EntityHitsTarget(id, target){
    var damage = EntityStrength(id);
    if (weapon != -1){
        damage += WeaponGetDamage(weapon);
        }
    else{
        damage += EntityGetUnarmedDamage(id);
        }
        
    var defense = EntityGetDefense(target);
    //lower defense for blunt weapon
    
    //weaknesses & resistances
    
    damage = max(0, damage - defense);
    
    show_debug_message(EntityGetName(id)+" attacked "+EntityGetName(target)+" for "+string(damage)+" damage");
    
    EntityTakeDamage(target, damage);
    }
else{
    //miss
    show_debug_message(EntityGetName(id)+" missed");
    
    audio_play_sound(snd_miss, 0, false);
    SplashMiss(target.draw_x, target.draw_y);
    }
    
scr_action_end();
EntityAddAttackCooldown(id);
