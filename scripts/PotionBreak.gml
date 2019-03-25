var potion = argument0;
var i = argument1;
var j = argument2;

switch(ItemType(potion)){
    case POTION.HEALTH:
        MapAddGas(i, j, GAS.HEALING, 81);
        break;
        
    case POTION.POISON:
        MapAddGas(i, j, GAS.TOXIC, 81);
        break;
        
    case POTION.PARALYSIS:
        MapAddGas(i, j, GAS.PARALYTIC, 81);
        break;
        
    case POTION.CONFUSION:
        MapAddGas(i, j, GAS.CONFUSION, 81);
        break;
        
    case POTION.FIRE:
        for(var ii = -1; ii <= 1; ii++){
            for(var jj = -1; jj <= 1; jj++){
                CellSetOnFire(map[# i + ii, j + jj]);
                }
            }
        break;
        
    default:
        break;
    }
        
//splash
audio_play_sound(snd_shatter, 0, false);
ItemDestroy(potion);
