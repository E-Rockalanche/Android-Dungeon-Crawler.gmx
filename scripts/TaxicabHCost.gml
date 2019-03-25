//returns taxicab hueristic cost of cell1 to cell2
var cell1, cell2;

cell1 = argument0;
cell2 = argument1;

return abs((cell1.i - cell2.i) + abs(cell1.j - cell2.j));
