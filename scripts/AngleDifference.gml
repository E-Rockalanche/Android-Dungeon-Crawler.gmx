var angle1 = argument0 mod 360;
var angle2 = argument1 mod 360;

return min(abs(angle1 - angle2), abs(angle2+360 - angle1), abs(angle1+360 - angle2));
