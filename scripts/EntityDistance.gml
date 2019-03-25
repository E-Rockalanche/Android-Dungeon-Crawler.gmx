var entity;
entity[1] = argument0;
entity[0] = argument1;

var xdist = INT_MAX, ydist = INT_MAX;

for(var n = 0; n <= 1; n++){
    xdist = min(xdist, abs(entity[n].i - (entity[!n].i + entity[!n].size - 1)));
    ydist = min(xdist, abs(entity[n].j - (entity[!n].j + entity[!n].size - 1)));
    }
    
return max(1, xdist, ydist);
