//return transformed map coordinate based on shadowcasting position and the current octant

var i, j, column, row, octant, pos;
i = argument0;
j = argument1;
column = argument2;
row = argument3;
octant = argument4;

switch(octant){
    case 0:
        pos[1] = j-row;
        pos[0] = i+column;
        break;
    case 1:
        pos[1] = j-column;
        pos[0] = i+row;
        break;
    case 2:
        pos[1] = j-column;
        pos[0] = i-row;
        break;
    case 3:
        pos[1] = j-row;
        pos[0] = i-column;
        break;
    case 4:
        pos[1] = j+row;
        pos[0] = i-column;
        break;
    case 5:
        pos[1] = j+column;
        pos[0] = i-row;
        break;
    case 6:
        pos[1] = j+column;
        pos[0] = i+row;
        break;
    case 7:
        pos[1] = j+row;
        pos[0] = i+column;
        break;
    }
    
return pos;
