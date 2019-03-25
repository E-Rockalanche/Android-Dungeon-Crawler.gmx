var rm = argument0;

rm[? ROOM.TYPE] = ROOM_TYPE.CIRCLE;

var diameter = min(rm[? ROOM.WIDTH], rm[? ROOM.HEIGHT]);
RoomScale(rm, 0, diameter);

var rm_left = rm[? ROOM.LEFT];
var rm_top = rm[? ROOM.TOP];
var rm_width = rm[? ROOM.WIDTH];
var rm_height = rm[? ROOM.HEIGHT];

show_debug_message("Room "+string(rm)+" set to CIRCLE in area ("+string(rm_left)+","+string(rm_top)+","+string(rm_left+rm_width)+","+string(rm_top+rm_height)+")");

var radius = (diameter-2)/2;//radius does not include walls
var pillar_radius = -1;
if (radius >= 4){
    pillar_radius = FixRadius(radius - 3);
    }
radius = FixRadius(radius);

var ci = diameter/2 - 0.5;
var cj = diameter/2 - 0.5;
for(var i = 1; i < rm_width-1; i++){
    for(var j = 1; j < rm_height-1; j++){
        var cell = map[# rm_left + i, rm_top + j];
        var dist = point_distance(ci, cj, i, j);
        if ((dist <= radius) && (dist > pillar_radius)){
            CellSetTileTemp(cell, TILE.FLOOR);
            }
        else{
            CellSetTileTemp(cell, TILE.WALL);
            }
        }
    }
