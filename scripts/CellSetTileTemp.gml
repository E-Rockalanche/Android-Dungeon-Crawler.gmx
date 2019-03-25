var cell = argument0;

ASSERT(!cell.permanent, "Trying to change tile of permanent cell at pos ("+string(cell.i)+","+string(cell.j)+")");

cell.tile = argument1;
