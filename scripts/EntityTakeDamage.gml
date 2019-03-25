with(obj_game){
    var entity = argument0;
    var damage = argument1;
    
    show_debug_message("EntityTakeDamage( "+EntityGetName(entity)+", "+string(damage)+" )");
    
    //splash
    SplashDamage(entity.draw_x, entity.draw_y, damage);
    audio_play_sound(snd_hit, 0, false);
    
    //stop player
    if (entity == player){
        player_automove = false;
        }
    
    //take damage
    entity.hp = max(0, entity.hp - damage);
    if (entity.hp == 0){
        //entity died
        EntityDie(entity);
        }
    }
