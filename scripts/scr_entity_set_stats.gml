//executed by obj_entity

strength = entity_table[entity_type, ENTITY.STRENGTH];
dexterity = entity_table[entity_type, ENTITY.DEXTERITY];
agility = entity_table[entity_type, ENTITY.AGILITY];
perception = entity_table[entity_type, ENTITY.PERCEPTION];
intelligence = entity_table[entity_type, ENTITY.INTELLIGENCE];
constitution = entity_table[entity_type, ENTITY.CONSTITUTION];

max_hp = constitution;
hp = max_hp;
hp_regen = 1;

max_mp = intelligence;
mp = max_mp;
mp_regen = 1;

max_stamina = strength;
stamina = max_stamina;
stamina_regen = 1;

max_hunger = 200;
hunger = max_hunger;
hunger_regen = -1;

view_distance = perception;
dodge = agility;
accuracy = dexterity;
stealth = agility;
combo = agility;
detection = perception;
