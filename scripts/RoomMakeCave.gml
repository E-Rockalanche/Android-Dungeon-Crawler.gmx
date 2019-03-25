var rm = argument0;

rm[? ROOM.TYPE] = ROOM_TYPE.CAVE;

var rm_width = rm[? ROOM.WIDTH];
var rm_height = rm[? ROOM.HEIGHT];

if (min(rm_width, rm_height) <= 5){
    //cannot make cave rooms to small or blobs will not generate
    RoomMakeSquare(rm);
    exit;
    }

var cave = LakeGenerate(rm_width, rm_height, min(rm_width-2, rm_height-2)-1, max(rm_width-2, rm_height-2), min(75, 45 + 20*(((rm_width-2 + rm_height-2)/2)/8)));
var cave_width = ds_grid_width(cave);
var cave_height = ds_grid_height(cave);

RoomResize(rm, cave_width + 2, cave_height + 2);
var rm_left = rm[? ROOM.LEFT];
var rm_top = rm[? ROOM.TOP];
rm_width = rm[? ROOM.WIDTH];
rm_height = rm[? ROOM.HEIGHT];

show_debug_message("Room "+string(rm)+" set to CAVE in area ("+string(rm_left)+","+string(rm_top)+","+string(rm_left+rm_width)+","+string(rm_top+rm_height)+")");

var min_dim = min(rm_width, rm_height);
var making_lake = ((min_dim >= MIN_LAKE_CAVE_SIZE) && Chance(25));

for(var i = 0; i < cave_width; i++){
    for(var j = 0; j < cave_height; j++){
        var cell = map[# rm_left + i + 1, rm_top + j + 1];
        if cave[# i,j]{
            if making_lake{
                CellSetTileTemp(cell, TILE.WATER);
                }
            else{
                CellSetTileTemp(cell, TILE.FLOOR);
                }
            }
        else{
            CellSetTileTemp(cell, TILE.WALL);
            }
        }
    }
ds_grid_destroy(cave);

if making_lake{
    MapSmoothArea(rm_left, rm_top, rm_width, rm_height, TILE.FLOOR, TILE.WATER, 0, 2, 2, true);
    for(var i = 0; i < cave_width; i++){
        for(var j = 0; j < cave_height; j++){
            var cell = map[# rm_left + i + 1, rm_top + j + 1];
            if (cell.tile == TILE.WATER){
                cell.permanent = true;
                }
            }
        }
    }
