enum ITEM{
    //required
    CATEGORY,//food, wand, weapon, armour, etc. Category might be predefined
    QUANTITY,
    FLOOR,//found on which floor?
    SPRITE,
    SPRITE_INDEX,
    
    //optional
    NAME,//if not predefined
    TYPE,//weapon type, armour type, wand type, etc
    ENCHANTMENT,//item specific
    LEVEL,//number of upgrades
    CHARGES,//wand uses
    
    INVENTORY,//item contains it's own inventory (key ring, bag of holding, etc)
    }
    
enum ITEM_CATEGORY{
    WEAPON,
    ARMOUR,
    AMMO,//only ammo kind right now is arrow
    PROJECTILE,
    RING,
    POTION,
    SCROLL,
    WAND,
    
    //predefined
    FOOD,
    KEY,
    KEY_RING,
    
    GOLD,//does not go into player inventory
    
    LENGTH,
    }
globalvar ITEM_IS_PREDEFINED, ITEM_CAN_STACK, ITEM_CAN_BE_IDENTIFIED, ITEM_CAN_BE_EQUIPPED, ITEM_CAN_BE_USED, ITEM_CAN_BE_ENCHANTED,
    ITEM_CAN_BE_UPGRADED, ITEM_IS_AUTOMATIC;
ITEM_IS_PREDEFINED = (BL(ITEM_CATEGORY.GOLD) | BL(ITEM_CATEGORY.FOOD) | BL(ITEM_CATEGORY.AMMO) | BL(ITEM_CATEGORY.KEY) | BL(ITEM_CATEGORY.KEY_RING));
ITEM_CAN_STACK = (BL(ITEM_CATEGORY.FOOD) | BL(ITEM_CATEGORY.AMMO) | BL(ITEM_CATEGORY.PROJECTILE) | BL(ITEM_CATEGORY.POTION) | BL(ITEM_CATEGORY.SCROLL) | BL(ITEM_CATEGORY.GOLD));
ITEM_CAN_BE_IDENTIFIED = (BL(ITEM_CATEGORY.WEAPON) | BL(ITEM_CATEGORY.ARMOUR) | BL(ITEM_CATEGORY.RING) | BL(ITEM_CATEGORY.POTION)
    | BL(ITEM_CATEGORY.SCROLL) | BL(ITEM_CATEGORY.WAND));
ITEM_CAN_BE_EQUIPPED =  (BL(ITEM_CATEGORY.WEAPON) | BL(ITEM_CATEGORY.ARMOUR) | BL(ITEM_CATEGORY.RING) | BL(ITEM_CATEGORY.WAND));
ITEM_CAN_BE_USED = (BL(ITEM_CATEGORY.FOOD) | BL(ITEM_CATEGORY.POTION) | BL(ITEM_CATEGORY.SCROLL));
ITEM_IS_AUTOMATIC = 0;//resurection items?
ITEM_CAN_BE_ENCHANTED = (BL(ITEM_CATEGORY.WEAPON) | BL(ITEM_CATEGORY.ARMOUR));
ITEM_CAN_BE_UPGRADED = (BL(ITEM_CATEGORY.WEAPON) | BL(ITEM_CATEGORY.ARMOUR) | BL(ITEM_CATEGORY.WAND) | BL(ITEM_CATEGORY.RING));

globalvar item_list_priority;
item_list_priority[ITEM_CATEGORY.LENGTH-1] = 0;

item_list_priority[ITEM_CATEGORY.WEAPON] = 800;
item_list_priority[ITEM_CATEGORY.ARMOUR] = 700;
item_list_priority[ITEM_CATEGORY.PROJECTILE] = 600;
item_list_priority[ITEM_CATEGORY.POTION] = 500;
item_list_priority[ITEM_CATEGORY.SCROLL] = 400;
item_list_priority[ITEM_CATEGORY.RING] = 300;
item_list_priority[ITEM_CATEGORY.WAND] = 200;
item_list_priority[ITEM_CATEGORY.FOOD] = 100;
item_list_priority[ITEM_CATEGORY.KEY] = 0;
item_list_priority[ITEM_CATEGORY.KEY_RING] = 0;
    
enum WEAPON{
    //hidden weapons
    KNUCKLES,
    CLAW,
    DAGGER,
    
    //one handed
    SHORT_SWORD,
    LONG_SWORD,
    RAPIER,
    WAR_AXE,
    CLUB,
    MACE,
    FLAIL,
    
    //two handed
    GREAT_SWORD,
    GREAT_AXE,
    WAR_HAMMER,
    HALBERD,
    
    //ranged
    //SLING,
    //SHORT_BOW,
    //LONG_BOW,
    
    LENGTH,
    }
globalvar WEAPON_IS_ONE_HANDED, WEAPON_IS_TWO_HANDED, WEAPON_IS_RANGED, WEAPON_USES_DEX, WEAPON_USES_STR, WEAPON_IS_SLASHING, WEAPON_IS_PIERCING,
    WEAPON_IS_BLUDGEONING, WEAPON_USES_AMMO;
WEAPON_IS_ONE_HANDED = (BL(WEAPON.KNUCKLES) | BL(WEAPON.CLAW) | BL(WEAPON.DAGGER) | BL(WEAPON.SHORT_SWORD) | BL(WEAPON.LONG_SWORD)
    | BL(WEAPON.RAPIER) | BL(WEAPON.WAR_AXE) | BL(WEAPON.MACE) | BL(WEAPON.FLAIL) | BL(WEAPON.CLUB));
WEAPON_IS_TWO_HANDED = ~WEAPON_IS_ONE_HANDED;
WEAPON_IS_RANGED = 0;//(BL(WEAPON.SHORT_BOW) | BL(WEAPON.LONG_BOW));
WEAPON_USES_DEX = (BL(WEAPON.CLAW) | BL(WEAPON.DAGGER) | BL(WEAPON.RAPIER));// | BL(WEAPON.SHORT_BOW));
WEAPON_USES_STR = ~WEAPON_USES_DEX;
WEAPON_IS_SLASHING = (BL(WEAPON.DAGGER) | BL(WEAPON.LONG_SWORD) | BL(WEAPON.WAR_AXE) | BL(WEAPON.GREAT_SWORD) | BL(WEAPON.GREAT_AXE));
WEAPON_IS_PIERCING = (BL(WEAPON.CLAW) | BL(WEAPON.RAPIER) | BL(WEAPON.SHORT_SWORD) | BL(WEAPON.HALBERD));// | BL(WEAPON.SHORT_BOW) | BL(WEAPON.LONG_BOW));
WEAPON_IS_BLUDGEONING = (BL(WEAPON.KNUCKLES) | BL(WEAPON.CLUB) | BL(WEAPON.MACE) | BL(WEAPON.FLAIL) | BL(WEAPON.WAR_HAMMER));
WEAPON_USES_AMMO = 0;//(BL(WEAPON.SHORT_BOW) | BL(WEAPON.LONG_BOW));

enum WEAPON_INDEX{
    NAME,
    MARKET_VALUE,
    MIN_DAMAGE,
    MAX_DAMAGE,
    WEIGHT,
    LENGTH,
    }
globalvar weapon_index;
//name, value, min damage, max damage, weight, 
weapon_index[WEAPON.LENGTH-1, WEAPON_INDEX.LENGTH-1] = 0;//initilaize array size
var index = 0;
//                              name,         market value,  min damage,  max damage, weight
IndexAdd(weapon_index, index++, "Iron Knuckles",    0,          1,          4,          0.5);
IndexAdd(weapon_index, index++, "Handheld Claw",    0,          1,          4,          0.5);
IndexAdd(weapon_index, index++, "Dagger",           0,          1,          4,          0.5);
IndexAdd(weapon_index, index++, "Short Sword",      0,          1,          6,          1);
IndexAdd(weapon_index, index++, "Long Sword",       0,          1,          8,          1);
IndexAdd(weapon_index, index++, "Rapier",           0,          1,          6,          0.5);
IndexAdd(weapon_index, index++, "War Axe",          0,          1,          8,          1);
IndexAdd(weapon_index, index++, "Club",             0,          1,          4,          1);
IndexAdd(weapon_index, index++, "Mace",             0,          1,          6,          1);
IndexAdd(weapon_index, index++, "Flail",            0,          1,          8,          2);
IndexAdd(weapon_index, index++, "Great Sword",      0,          1,          12,          2);
IndexAdd(weapon_index, index++, "Great Axe",        0,          1,          12,          2);
IndexAdd(weapon_index, index++, "War Hammer",       0,          1,          8,          2);
IndexAdd(weapon_index, index++, "Halberd",          0,          1,          10,          2);
//IndexAdd(weapon_index, index++, "Short Bow",        0,          1,          6,          1);
//IndexAdd(weapon_index, index++, "Long Bow",         0,          1,          8,          1);
    
enum PROJECTILE{
    ROCK,
    DART,
    BOOMERANG,
    SHURIKEN,
    THROWING_AXE,
    
    LENGTH,
    }
globalvar PROJECTILE_USES_DEX, PROJECTILE_USES_STR, PROJECTILE_IS_SLASHING, PROJECTILE_IS_PIERCING, PROJECTILE_IS_BLUDGEONING;
PROJECTILE_USES_STR = (BL(PROJECTILE.THROWING_AXE));
PROJECTILE_USES_DEX = ~PROJECTILE_USES_STR;
PROJECTILE_IS_SLASHING = (BL(PROJECTILE.THROWING_AXE));
PROJECTILE_IS_PIERCING = (BL(PROJECTILE.DART) | BL(PROJECTILE.BOOMERANG) | BL(PROJECTILE.SHURIKEN));
PROJECTILE_IS_BLUDGEONING = (BL(PROJECTILE.ROCK));

enum PROJECTILE_INDEX{
    NAME,
    MARKET_VALUE,
    MIN_DAMAGE,
    MAX_DAMAGE,
    
    LENGTH,
    }
globalvar projectile_index;
//name, value, min damage, max damage, weight, 
projectile_index[PROJECTILE.LENGTH-1, PROJECTILE_INDEX.LENGTH-1] = 0;//initilaize array size
index = 0;
//                                  name,         market value,  min damage,  max damage
IndexAdd(projectile_index, index++, "Rock",             0,          1,          2);
IndexAdd(projectile_index, index++, "Dart",             0,          1,          4);
IndexAdd(projectile_index, index++, "Boomerang",        0,          1,          4);
IndexAdd(projectile_index, index++, "Shuriken",         0,          1,          4);
IndexAdd(projectile_index, index++, "Throwing Axe",     0,          1,          6);
    
enum ARMOUR{
    //light armour
    PADDED,
    HIDE,
    LEATHER,
    STUDDED,
    
    //heavy
    CHAIN,
    SPLINT,
    LAMINAR,
    PLATE,
    
    LENGTH,
    }
globalvar ARMOUR_IS_LIGHT, ARMOUR_IS_HEAVY;
ARMOUR_IS_LIGHT = (BL(ARMOUR.PADDED) | BL(ARMOUR.HIDE) | BL(ARMOUR.LEATHER) | BL(ARMOUR.STUDDED));
ARMOUR_IS_HEAVY = ~ARMOUR_IS_LIGHT;

enum ARMOUR_INDEX{
    NAME,
    MARKET_VALUE,
    DEFENSE,
    WEIGHT,
    LENGTH,
    }
globalvar armour_index;
//name, value, min damage, max damage, weight, 
armour_index[ARMOUR.LENGTH-1, ARMOUR_INDEX.LENGTH-1] = 0;//initilaize array size
index = 0;
//                              name,         market value,  defense,    weight
IndexAdd(armour_index, index++, "Padded Armour",            0,          1,          1);
IndexAdd(armour_index, index++, "Hide Armour",              0,          2,          1);
IndexAdd(armour_index, index++, "Leather Armour",           0,          3,          1);
IndexAdd(armour_index, index++, "Studded Armour",           0,          4,          1);
IndexAdd(armour_index, index++, "Chain Mail",               0,          7,          2);
IndexAdd(armour_index, index++, "Splint Armour",            0,          8,          3);
IndexAdd(armour_index, index++, "Laminar Ar,our",           0,          9,          4);
IndexAdd(armour_index, index++, "Plate Mail",               0,          10,         5);

enum W_ENCHANTMENT{
    NONE,
    
    LENGTH,
    }

enum A_ENCHANTMENT{
    NONE,
    
    LENGTH,
    }

enum RING{
    STEALTH,
    HEALTH,
    HUNGER,
    SPEED,
    PERCEPTION,
    FURY,
    
    LENGTH,
    }
globalvar ring_name;
ring_name[RING.LENGTH-1] = 0;//initilaize array size
ring_name[RING.STEALTH] = "Ring of stealth";
ring_name[RING.HEALTH] = "Ring of health";
ring_name[RING.HUNGER] = "Ring of hunger";
ring_name[RING.SPEED] = "Ring of speed";
ring_name[RING.PERCEPTION] = "Ring of perception";
ring_name[RING.FURY] = "Ring of fury";
    
enum WAND{
    FIRE,
    MAGIC_MISSILE,
    LIGHTNING,
    TELEPORTATION,
    BLINKING,
    REGROWTH,
    ICE,
    HEALING,
    DOMINATION,

    LENGTH,
    }
globalvar wand_name;
wand_name[WAND.LENGTH-1] = 0;//initilaize array size
wand_name[WAND.FIRE] = "Wand of fire";
wand_name[WAND.MAGIC_MISSILE] = "Wand of magic missile";
wand_name[WAND.LIGHTNING] = "Wand of lightning";
wand_name[WAND.TELEPORTATION] = "Wand of teleportation";
wand_name[WAND.BLINKING] = "Wand of blinking";
wand_name[WAND.REGROWTH] = "Wand of regrowth";
wand_name[WAND.ICE] = "Wand of ice";
wand_name[WAND.HEALING] = "Wand of healing";
wand_name[WAND.DOMINATION] = "Wand of domination";
    
enum POTION{
    HEALTH,
    FIRE,
    STRENGTH,
    AGILITY,
    CONFUSION,
    POISON,
    PARALYSIS,

    LENGTH,
    }
globalvar potion_name;
potion_name[POTION.LENGTH-1] = 0;//initilaize array size
potion_name[POTION.HEALTH] = "Potion of health";
potion_name[POTION.FIRE] = "Potion of fire";
potion_name[POTION.STRENGTH] = "Potion of strength";
potion_name[POTION.AGILITY] = "Potion of agility";
potion_name[POTION.CONFUSION] = "Potion of confusion";
potion_name[POTION.POISON] = "Potion of poison";
potion_name[POTION.PARALYSIS] = "Potion of paralysis";
    
enum SCROLL{
    MAGIC_MAPPING,
    RECHARGING,
    UPGRADE,
    LULLABY,
    
    LENGTH,
    }
globalvar scroll_name;
scroll_name[SCROLL.LENGTH-1] = 0;//initilaize array size
scroll_name[SCROLL.MAGIC_MAPPING] = "Scroll of magic mapping";
scroll_name[SCROLL.RECHARGING] = "Scroll of recharging";
scroll_name[SCROLL.UPGRADE] = "Scroll of upgrade";
scroll_name[SCROLL.LULLABY] = "Scroll of upgrade";

enum BOLT{
    WAND,
    ITEM,
    }
