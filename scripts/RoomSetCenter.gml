//there MUST be valid cells in the room to become the pathdinding center

var rm = argument0;

var left = rm[? ROOM.LEFT]+1;
var top = rm[? ROOM.TOP]+1;
var rm_width = rm[? ROOM.WIDTH]-2;
var rm_height = rm[? ROOM.HEIGHT]-2;

var center;
do{
    var i = left + irandom(rm_width);
    var j = top + irandom(rm_height);
    center = map[# i,j];
    }until(center.in_room);

rm[? ROOM.CENTER] = center;
