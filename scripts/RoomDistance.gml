var room1, room2, d1, d2, d3, d4;
room1 = argument0;
room2 = argument1;

d1 = room2[? ROOM.LEFT] - (room1[? ROOM.LEFT] + room1[? ROOM.WIDTH]);
d2 = room1[? ROOM.LEFT] - (room2[? ROOM.LEFT] + room2[? ROOM.WIDTH]);

d3 = room2[? ROOM.TOP] - (room1[? ROOM.TOP] + room1[? ROOM.HEIGHT]);
d4 = room1[? ROOM.TOP] - (room2[? ROOM.TOP] + room2[? ROOM.HEIGHT]);

return max(0, d1, d2, d3, d4);
