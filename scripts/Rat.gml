var new_entity = instance_create(0,0,obj_entity);
with(new_entity){
    /*-----------------------REQUIRED-----------------------*/

    name = "Rat";
    
    sprite_stand = spr_rat_stand;
    sprite_walk = spr_rat_walk;
    sprite_attack = spr_rat_attack;
    sprite_die = spr_rat_die;
    sprite_use = spr_rat_attack;
    
    
    strength = 3;//heavy weapon damage, carry weight, health?
    agility = 3;//movement speed, dodge chance
    perception = 3;//detect hidden objects
    intelligence = 3;//magic, memorize magic scrolls
    dexterity = 3;//light weapon damage, stealth (reduced by armour weight)
    constitution = 3;//health, resistances?
    
    max_hp = constitution;
    hp = max_hp;
    max_magic = intelligence;
    magic = max_magic;
    
    scr_set_basic_permissions();
    
    /*-----------------------OPTIONAL-----------------------*/
    }
return new_entity;
