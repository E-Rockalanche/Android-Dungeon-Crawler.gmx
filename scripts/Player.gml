var new_entity = instance_create(0,0,obj_entity);
with(new_entity){
    /*-----------------------REQUIRED-----------------------*/

    name = "You";
    
    sprite_stand = spr_rogue_stand;
    sprite_walk = spr_rogue_walk;
    sprite_attack = spr_rogue_attack;
    sprite_die = spr_player_die;
    sprite_use = spr_rogue_use;
    
    
    strength = 2;//heavy weapon damage, carry weight, health?
    agility = 10;//movement speed, dodge chance
    perception = 10;//detect hidden objects
    intelligence = 10;//magic, memorize magic scrolls
    dexterity = 10;//light weapon damage, stealth (reduced by armour weight)
    constitution = 10;//health, resistances?
    
    max_hp = INT_MAX;
    hp = max_hp;
    max_magic = INT_MAX;
    magic = max_magic;
    max_hunger = INT_MAX;
    hunger = max_hunger;
    
    scr_set_player_permissions();
    
    can_pick_up = true;
    can_use_items = true;
    
    alliance = ALLIANCE.PLAYER;
    state = ENTITY_STATE.PLAYER;
    action = ENTITY_ACTION.WAIT;
    action_alarm = -1;
    
    /*-----------------------OPTIONAL-----------------------*/
    
    in_view = true;
    
    var sword = ItemCreate(1, ITEM_CATEGORY.WEAPON, WEAPON.SHORT_SWORD);
    InventoryAdd(inventory, sword);
    weapon = sword;
    }
return new_entity;
