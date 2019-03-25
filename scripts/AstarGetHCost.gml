//returns hueristic cost of cell1 to cell2
var cell1, cell2, ii, jj, coordinate, diagonal;

cell1 = argument0;
cell2 = argument1;

//return round(point_distance(cell1.i, cell1.j, cell2.i, cell2.j)*10);

ii = abs(cell1.i - cell2.i);
jj = abs(cell1.j - cell2.j);

coordinate = max(ii, jj);
diagonal = min(ii, jj);

return (coordinate*10 + diagonal*4)*1.001;
