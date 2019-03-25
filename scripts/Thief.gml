var new_entity = instance_create(0,0,obj_entity);
with(new_entity){
    /*-----------------------REQUIRED-----------------------*/

    name = "Thief";
    
    sprite_stand = spr_thief_stand;
    sprite_walk = spr_thief_walk;
    sprite_attack = spr_thief_attack;
    sprite_die = spr_thief_die;
    sprite_use = spr_thief_attack;
    
    
    strength = 5;//heavy weapon damage, carry weight, health?
    agility = 5;//movement speed, dodge chance
    perception = 5;//detect hidden objects
    intelligence = 5;//magic, memorize magic scrolls
    dexterity = 5;//light weapon damage, stealth (reduced by armour weight)
    constitution = 5;//health, resistances?
    
    max_hp = constitution;
    hp = max_hp;
    max_magic = intelligence;
    magic = max_magic;
    
    scr_set_basic_permissions();
    
    /*-----------------------OPTIONAL-----------------------*/
    
    can_pick_up = true;
    can_use_items = true;
    }
return new_entity;
