enum ANIMATED_TILES{
    BACKGROUND,//default background image
    IMAGE_INDEX,//current image index
    IMAGE_SPEED,//speed at which to cycle through animation
    ANIMATION_LENGTH,
    LENGTH,
    //LENGTH -> LENGTH+ANIMATION_LENGTH: images
    }

animated_tiles = ds_grid_create(1, ANIMATED_TILES.LENGTH);
animated_tiles[# 0, ANIMATED_TILES.BACKGROUND] = bkr_water_default;
animated_tiles[# 0, ANIMATED_TILES.IMAGE_INDEX] = 0;
animated_tiles[# 0, ANIMATED_TILES.IMAGE_SPEED] = 1/8;
animated_tiles[# 0, ANIMATED_TILES.ANIMATION_LENGTH] = 0;

AnimatedTilesAdd(bkr_water1, bkr_water2, bkr_water3, bkr_water2);
