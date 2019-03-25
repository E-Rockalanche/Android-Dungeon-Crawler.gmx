//return map cell based on octant position

var i, j, column, row, octant, pos;
i = argument0;
j = argument1;
column = argument2;
row = argument3;
octant = argument4;

switch(octant){
    case 0:
        return map[# i+column, j-row];
    case 1:
        return map[# i+row, j-column];
    case 2:
        return map[# i-row, j-column];
    case 3:
        return map[# i-column, j-row];
    case 4:
        return map[# i-column, j+row];
    case 5:
        return map[# i-row, j+column];
    case 6:
        return map[# i+row, j+column];
    case 7:
        return map[# i+column, j+row];
    }
