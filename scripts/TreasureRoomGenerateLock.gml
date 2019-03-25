var rm = argument0;

switch(irandom(2)){
    case 0:
        rm[? ROOM.LOCK] = TILE.WOOD;
        rm[? ROOM.KEY] = ItemCreate(floor_depth, ITEM_CATEGORY.WAND, WAND.FIRE);
        break;
    
    case 1:
        rm[? ROOM.LOCK] = TILE.DOOR_LOCKED;
        rm[? ROOM.KEY] = ItemCreate(floor_depth, ITEM_CATEGORY.KEY);
        break;
    
    case 2:
        rm[? ROOM.LOCK] = TILE.DOOR_HIDDEN;
        rm[? ROOM.KEY] = -1;
        break;
        
    default:
        ASSERT(false, "Unknown treasure room puzzle in TreasureRoomGenerateLock()");
    }
