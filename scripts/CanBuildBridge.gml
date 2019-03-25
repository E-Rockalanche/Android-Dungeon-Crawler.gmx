var start = argument0;
var dir = argument1;

var bridge_length = 0;
var i = start.i;
var j = start.j;
var i_inc = dirs[dir,0];
var j_inc = dirs[dir,1];
var can_be_bridge;
var cell;
var cost = 0;

//first cell is lake
do{
    i += i_inc;
    j += j_inc;
    cell = map[# i,j];
    can_be_bridge = ((BL(cell.tile) & TILE_IS_LAKE) > 0);
    bridge_length += can_be_bridge;
    }until(!can_be_bridge);
return ((i != 0) && (j != 0) && (i != width-1) && (j != height-1) && (bridge_length >= MIN_BRIDGE_LENGTH));
