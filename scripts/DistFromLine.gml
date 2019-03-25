var ux, uy, vx, vy;

vx = argument2 - argument0;
vy = argument3 - argument1;
ux = argument4 - argument0;
uy = argument5 - argument1;

v = sqrt(sqr(vx) + sqr(vy));
uv = ux*vx + uy*vy;

zx = uv*vx/v;
zy = uv*vy/v;

return point_distance(zx, zy, ux, uy);
