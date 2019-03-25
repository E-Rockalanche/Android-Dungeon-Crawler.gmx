//returns hueristic cost of cell1 to cell2
var start, goal, cell, ii, jj, coordinate, diagonal;

start = argument0;
goal = argument1;
cell = argument2;

//return round(point_distance(cell1.i, cell1.j, cell2.i, cell2.j)*10);

ii = abs(cell.i - goal.i);
jj = abs(cell.j - goal.j);

coordinate = max(ii, jj);
diagonal = min(ii, jj);

return (coordinate*10 + diagonal*4)*DistFromLine(start.i, start.j, goal.i, goal.j, cell.i, cell.j)/(48);
