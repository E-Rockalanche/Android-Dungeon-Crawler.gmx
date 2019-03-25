enum ENTITY{
    PLAYER,
    NPC,
    ALLY,
    SHOPKEEPER,
    BOSS,
    ENEMY,
    
    LENGTH,
    };
    
enum ENEMY{
    RAT,
    BAT,
    GHOST,
    FISH,
    THIEF,
    
    LENGTH,
    };
    
enum ENTITY_STATE{
    PLAYER,//unique for player entity
    ALLY,//unique for permanent player allies
    
    DORMANT,//entity stands still until player comes into view
    SLEEPING,//player can sneak past sleeping enemies
    UNACTIVATED,//entity waits for player activation (statues, etc)
    
    WANDERING,//entity walks randomly around dungeon
    SEARCHING,//entity is trying to find the player
    HUNTING,//entity can see and is aggressive towards the player
    
    DEAD,
    }
    
enum STATUS{
    ON_FIRE,
    POISONED,
    FROZEN,
    SLEEPING,
    PARALYZED,
    CONFUSED,
    
    LENGTH,
    }

enum ENTITY_ACTION{
    UNDECIDED,
    WILL_MOVE,
    MOVE,
    ATTACK,
    EQUIP,
    UNEQUIP,
    USE,
    EAT,
    DRINK,
    READ,
    THROW,
    DROP,
    PICK_UP,
    ZAP_WAND,
    USE_ABILITY,
    WAIT,
    };
globalvar action_string;
action_string[ENTITY_ACTION.WAIT] = "Wait";
action_string[ENTITY_ACTION.UNDECIDED] = "Undecided";
action_string[ENTITY_ACTION.WILL_MOVE] = "Will move";
action_string[ENTITY_ACTION.MOVE] = "Move";
action_string[ENTITY_ACTION.ATTACK] = "Attack";
action_string[ENTITY_ACTION.EQUIP] = "Equip";
action_string[ENTITY_ACTION.UNEQUIP] = "Unequip";
action_string[ENTITY_ACTION.USE] = "Use";
action_string[ENTITY_ACTION.EAT] = "Eat";
action_string[ENTITY_ACTION.DRINK] = "Drink";
action_string[ENTITY_ACTION.READ] = "Read";
action_string[ENTITY_ACTION.THROW] = "Throw";
action_string[ENTITY_ACTION.DROP] = "Drop";
action_string[ENTITY_ACTION.PICK_UP] = "Pick up";
action_string[ENTITY_ACTION.ZAP_WAND] = "Zap Wand";
action_string[ENTITY_ACTION.USE_ABILITY] = "Use Ability";
    
enum ALLIANCE{
    PLAYER,//player and allies
    GOOD,//NPCs
    EVIL,//enemies
    };
    
enum ITEM_ACTION{
    THROW,
    DROP,
    USE,
    EQUIP,
    UNEQUIP,
    ZAP,
    
    LENGTH,
    };
globalvar item_action_text;
item_action_text[ITEM_ACTION.LENGTH-1] = 0;

item_action_text[ITEM_ACTION.THROW] = "Throw";
item_action_text[ITEM_ACTION.DROP] = "Drop";
item_action_text[ITEM_ACTION.USE] = "Use";
item_action_text[ITEM_ACTION.EQUIP] = "Equip";
item_action_text[ITEM_ACTION.UNEQUIP] = "Unequip";
item_action_text[ITEM_ACTION.ZAP] = "Zap";

//AI goals
enum GOAL{
    NOTHING,
    KILL_ENEMIES,
    FIND_TREASURE,
    PROTECT_TREASURE,
    RUN_AWAY,
    SLEEP,
    HEAL,
    GUARD,
    WANDER,
    
    LENGTH,
    };
globalvar goal_string;
goal_string[GOAL.WANDER] = "Wander";
goal_string[GOAL.GUARD] = "Guard";
goal_string[GOAL.HEAL] = "Heal";
goal_string[GOAL.SLEEP] = "Sleep";
goal_string[GOAL.RUN_AWAY] = "Run away";
goal_string[GOAL.PROTECT_TREASURE] = "Protect treasure";
goal_string[GOAL.FIND_TREASURE] = "Find treasure";
goal_string[GOAL.KILL_ENEMIES] = "Kill enemies";
goal_string[GOAL.NOTHING] = "Nothing";
/*
goals dependant on entity variables:

health
enemy health
treasure location
morale
fatigue

etc
*/

enum ABILITY{
    SPECTRAL_SIGHT,
    
    LENGTH,
    }
