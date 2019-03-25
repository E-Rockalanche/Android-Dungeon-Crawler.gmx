var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var progress = argument4;

var dist = max(abs(x2 - x1), abs(y2 - y1));

progress = round(dist*progress)/dist;

return Vec2(round(x1 + (x2 - x1)*progress), round(y1 + (y2 - y1)*progress));
