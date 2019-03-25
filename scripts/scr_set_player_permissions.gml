//executed by obj_entity

//sets permissions to all except impassible terrain

for(var n = 0; n < TILE.LENGTH; n++){
    permissions[n] = true;
    }
permissions[TILE.WALL] = false;
permissions[TILE.WOOD] = false;
permissions[TILE.STATUE] = false;
permissions[TILE.BOOKSHELF] = false;
permissions[TILE.DOOR_LOCKED] = false;
permissions[TILE.WALL_DECAL] = false;

permissions[TILE.ERROR] = false;
