var last_index = animated_tiles[# 0, ANIMATED_TILES.IMAGE_INDEX];
var cur_index = (last_index + delta*animated_tiles[# 0, ANIMATED_TILES.IMAGE_SPEED]) mod animated_tiles[# 0, ANIMATED_TILES.ANIMATION_LENGTH];
animated_tiles[# 0, ANIMATED_TILES.IMAGE_INDEX] = cur_index;
if (floor(cur_index) != floor(last_index)){
    //next image
    background_assign(animated_tiles[# 0, ANIMATED_TILES.BACKGROUND], animated_tiles[# 0, ANIMATED_TILES.LENGTH + floor(cur_index)]);
    }
