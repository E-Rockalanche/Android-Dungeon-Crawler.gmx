var new_entity = instance_create(0,0,obj_entity);
with(new_entity){
    /*-----------------------REQUIRED-----------------------*/

    name = "Bat";
    
    sprite_stand = spr_bat_fly;
    sprite_walk = spr_bat_fly;
    sprite_attack = spr_bat_attack;
    sprite_die = spr_bat_die;
    sprite_use = spr_bat_attack;
    
    
    strength = 6;//heavy weapon damage, carry weight, health?
    agility = 6;//movement speed, dodge chance
    perception = 6;//detect hidden objects
    intelligence = 6;//magic, memorize magic scrolls
    dexterity = 6;//light weapon damage, stealth (reduced by armour weight)
    constitution = 6;//health, resistances?
    
    max_hp = constitution;
    hp = max_hp;
    max_magic = intelligence;
    magic = max_magic;
    
    scr_set_flying_permissions();
    
    /*-----------------------OPTIONAL-----------------------*/
    }
return new_entity;
