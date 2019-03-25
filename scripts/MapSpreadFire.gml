var i = argument0;
var j = argument1;
for(var d = 0; d < 8; d++){
    var cur_cell = map[# i+dirs[d,0], j+dirs[d,1]];
    if cur_cell.flamable{
        CellSetOnFire(cur_cell);
        cur_cell.caught_fire_this_turn = true;
        }
    }
