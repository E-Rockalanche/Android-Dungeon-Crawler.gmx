var new_entity = instance_create(0,0,obj_entity);
with(new_entity){
    /*-----------------------REQUIRED-----------------------*/

    name = "Ghost";
    
    sprite_stand = spr_ghost;
    sprite_walk = spr_ghost;
    sprite_attack = spr_ghost_attack;
    sprite_die = spr_ghost_die;
    sprite_use = spr_ghost_attack;
    
    
    strength = 9;//heavy weapon damage, carry weight, health?
    agility = 9;//movement speed, dodge chance
    perception = 9;//detect hidden objects
    intelligence = 9;//magic, memorize magic scrolls
    dexterity = 9;//light weapon damage, stealth (reduced by armour weight)
    constitution = 9;//health, resistances?
    
    max_hp = constitution;
    hp = max_hp;
    max_magic = intelligence;
    magic = max_magic;
    
    scr_set_ghost_permissions();
    
    /*-----------------------OPTIONAL-----------------------*/
    }
return new_entity;
