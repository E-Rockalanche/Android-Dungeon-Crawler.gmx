var rm = argument0;
var item = argument1;

show_debug_message("RoomAddItem( "+string(rm)+", "+ItemGetName(item)+" )");

var rm_left = rm[? ROOM.LEFT];
var rm_top = rm[? ROOM.TOP];
var rm_right = rm_left + rm[? ROOM.WIDTH] - 1;
var rm_bottom = rm_top + rm[? ROOM.HEIGHT] - 1;

show_debug_message("Placing item in bounds ("+string(rm_left)+", "+string(rm_top)+", "+string(rm_right)+", "+string(rm_bottom)+")");

var i, j, cell;
do{
    i = irandom_range(rm_left+1, rm_right-1);
    j = irandom_range(rm_top+1, rm_bottom-1);
    ASSERT(PosInBox(i,j, 1, 1, width-2, height-2), "Pos ("+string(i)+", "+string(j)+") out of bounds");
    i = clamp(i,1,width-2);
    j = clamp(j,1,height-2);
    cell = map[# i,j];
    }until((BL(cell.tile) & TILE_IS_GROUND) && cell.in_room);
    
CellAddItem(cell, item);
