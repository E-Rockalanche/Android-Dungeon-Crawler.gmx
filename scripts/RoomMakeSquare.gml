var rm = argument0;

//creates a random cross of two rooms

rm[? ROOM.TYPE] = ROOM_TYPE.SQUARE;

var rm_left = rm[? ROOM.LEFT];
var rm_top = rm[? ROOM.TOP];
var rm_width = rm[? ROOM.WIDTH];
var rm_height = rm[? ROOM.HEIGHT];

show_debug_message("Room "+string(rm)+" set to SQUARE in area ("+string(rm_left)+","+string(rm_top)+","+string(rm_left+rm_width)+","+string(rm_top+rm_height)+")");

//create cross on grid
var grid = ds_grid_create(rm_width, rm_height);//0: out of room, 1: wall, 2: floor

var rec_left, rec_top, rec_width, rec_height;
rec_left[1] = 0;
rec_width[1] = rm_width;
rec_height[1] = max(MIN_ROOM_SIZE, irandom(rm_height));
rec_top[1] = irandom(rm_height - rec_height[1]);

rec_top[0] = 0;
rec_height[0] = rm_height;
rec_width[0] = max(MIN_ROOM_SIZE, irandom(rm_width));
rec_left[0] = irandom(rm_width - rec_width[0]);

for(var n = 0; n <= 1; n++){
    ds_grid_set_region(grid, rec_left[n], rec_top[n], rec_left[n]+rec_width[n]-1, rec_top[n]+rec_height[n]-1, 1);
    }
for(var n = 0; n <= 1; n++){
    ds_grid_set_region(grid, rec_left[n]+1, rec_top[n]+1, rec_left[n]+rec_width[n]-2, rec_top[n]+rec_height[n]-2, 2);
    }
    
//translate cross to map cells
for(var i = 0; i < rm_width; i++){
    for(var j = 0; j < rm_height; j++){
        var cell = map[# rm_left+i, rm_top+j];
        
        if (cell.permanent){
            continue;
            }
        
        if (grid[# i,j] == 2){
            CellSetTileTemp(cell, TILE.FLOOR);
            }
        else if (grid[# i,j] == 1){
            CellSetTileTemp(cell, TILE.WALL);
            }
        }
    }
    
ds_grid_destroy(grid);
    
//set wall corners to permanent
for(var n = 0; n <= 1; n++){
    SetWallPermanent(map[# rm_left+rec_left[n],                  rm_top+rec_top[n]]);
    SetWallPermanent(map[# rm_left+rec_left[n],                  rm_top+rec_top[n]+rec_height[n]-1]);
    SetWallPermanent(map[# rm_left+rec_left[n]+rec_width[n]-1,   rm_top+rec_top[n]]);
    SetWallPermanent(map[# rm_left+rec_left[n]+rec_width[n]-1,   rm_top+rec_top[n]+rec_height[n]-1]);
    }
SetWallPermanent(map[# rm_left+rec_left[0]+rec_width[0]-1,   rm_top+rec_top[1]]);
SetWallPermanent(map[# rm_left+rec_left[0],                  rm_top+rec_top[1]+rec_height[1]-1]);
SetWallPermanent(map[# rm_left+rec_left[0],                  rm_top+rec_top[1]]);
SetWallPermanent(map[# rm_left+rec_left[0]+rec_width[0]-1,   rm_top+rec_top[1]+rec_height[1]-1]);
