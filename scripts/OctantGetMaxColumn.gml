var i, j, octant, max_dist;

i = argument0;
j = argument1;
octant = argument2;
max_dist = argument3;

switch(octant){
    case 0:
    case 7:
        return min((map_width-1)-i,max_dist);
    case 1:
    case 2:
        return min(j,max_dist);
    case 3:
    case 4:
        return min(i,max_dist);
    case 5:
    case 6:
        return min((map_height-1)-j,max_dist);
    }
