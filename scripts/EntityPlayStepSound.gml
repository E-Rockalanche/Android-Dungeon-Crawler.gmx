var entity = argument0;
if entity.in_view{
    switch(entity.cell.tile){
        case TILE.FLOOR:
        case TILE.RUBBLE:
        case TILE.GRASS:
        case TILE.TALL_GRASS:
        case TILE.DOOR_OPEN:
            audio_play_sound(snd_step, 0, false);
            break;
        
        case TILE.WATER:
            if (entity.name != "Fish"){//temporary fix
                audio_play_sound(snd_water, 0, false);
                }
            break;
        
        case TILE.DOOR_CLOSED:
            audio_play_sound(snd_door_open, 0, false);
            break;
        }
    }
