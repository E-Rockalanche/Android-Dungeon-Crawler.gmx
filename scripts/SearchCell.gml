var cell = argument0;

if (cell.tile == TILE.DOOR_HIDDEN){
    CellSetTile(cell, TILE.DOOR_CLOSED);
    audio_play_sound(snd_secret, 0, false);
    }
if (cell.object != -1){
    //check for traps
    }
