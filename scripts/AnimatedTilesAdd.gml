ds_grid_resize(animated_tiles, 1, ds_grid_height(animated_tiles)+argument_count);
animated_tiles[# 0, ANIMATED_TILES.ANIMATION_LENGTH] += argument_count;
for(var n = 0; n < argument_count; n++){
    animated_tiles[# 0, ANIMATED_TILES.LENGTH + n] = argument[n];
    }
