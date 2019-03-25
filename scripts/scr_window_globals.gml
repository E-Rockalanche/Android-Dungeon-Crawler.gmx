enum BUTTON{
    //general
    X,
    Y,
    WIDTH,
    HEIGHT,
    
    //specific
    ENABLED,
    ITEM,
    TEXT,
    OPTION,
    }

enum BUTTON_OPTION{
    //item options (must be same as ITEM_ACTIONS)
    THROW,
    DROP,
    USE,
    EQUIP,
    UNEQUIP,
    ZAP,
    
    //HUD options
    OPEN_BAG,
    OPEN_STATS,
    SEARCH,
    LOOK,
    }
    
enum INVENTORY_MODE{
    ALL,
    UPGRADABLE,
    ENCHANTABLE,
    UNIDENTIFIED,
    FOR_SALE,
    WEAPON,
    ARMOUR,
    WAND,
    }
    
