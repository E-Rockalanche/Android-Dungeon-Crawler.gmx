var new_entity = instance_create(0,0,obj_entity);
with(new_entity){
    /*-----------------------REQUIRED-----------------------*/

    name = "Fish";
    
    sprite_stand = spr_fish_swim;
    sprite_walk = spr_fish_swim;
    sprite_attack = spr_fish_attack;
    sprite_die = spr_fish_die;
    sprite_use = spr_fish_attack;
    
    strength = 12;//heavy weapon damage, carry weight, health?
    agility = 12;//movement speed, dodge chance
    perception = 12;//detect hidden objects
    intelligence = 12;//magic, memorize magic scrolls
    dexterity = 12;//light weapon damage, stealth (reduced by armour weight)
    constitution = 12;//health, resistances?
    
    max_hp = constitution;
    hp = max_hp;
    max_magic = intelligence;
    magic = max_magic;
    
    alert_player_on_sight = false;
    
    scr_set_water_permissions();
    
    /*-----------------------OPTIONAL-----------------------*/
    }
return new_entity;
