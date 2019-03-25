var view = argument0;
var mask = argument1;//ds_grid
var i = argument2;
var j = argument3;
var octant = argument4;
var max_radius = argument5;
var start_column = argument6;
var start_slope = argument7;
var end_slope = argument8;
var add_walls = argument9;
var in_water = argument10;

//  \2|1/
//  3\|/0
//  --@--
//  4/|\7
//  /5|6\

//safeguards
if (start_column > max_radius) exit;
if (end_slope < start_slope) exit;

//for each column in view
for(var column = start_column; column <= max_radius; column++){
    
    var start_row = ceil(start_slope*(column) - 0.5);
    var end_row = min(ceil(end_slope*(column)), column);
    
    
    //restrict vision to circle
    if ((column*column + start_row*start_row) > (max_radius*max_radius)){
        exit;
        }
    if ((column*column + end_row*end_row) > (max_radius*max_radius)){
        end_row = floor(sqrt(max_radius*max_radius - column*column));
        }
    
    
    //for each row of column in view
    for(var row = start_row; row <= end_row; row++){
        var pos = OctantGetPos(i, j, column, row, octant);
        var ii = pos[0];
        var jj = pos[1];
        
        //stop if out of bounds. Should restrict column and row instead?
        if ((ii < 0) || (jj < 0) || (ii >= map_width) || (jj >= map_height)) exit;
        
        var cur_cell = map[# ii, jj];
        obstructs_view = cur_cell.obstructs_view || ((cur_cell.tile != TILE.WATER) && in_water);
        
        if (obstructs_view && add_walls){
            //if next closest tile to center is in mask, add this wall to mask
            var pos2 = OctantGetPos(i, j, column-1, max(0, row-1), octant);
            if mask[# pos2[0], pos2[1]] && !mask[# ii, jj]{
                mask[# ii, jj] = true;
                ds_list_add(view, cur_cell);
                }
            }
        else if !mask[# ii, jj]{
            //add to mask
            mask[# ii, jj] = true;
            ds_list_add(view, cur_cell);
            }
            
        if obstructs_view{
            //split scan into two
            //start new scan below wall, old scan continues above wall
            var new_start_slope = (row + 0.5)/(column - 0.5);
            var new_end_slope = (row - 0.5)/(column + 0.5);
            
            if (new_end_slope >= start_slope){
                if (end_slope >= new_start_slope){
                    //split scan
                    FOVScanOctant(view, mask, i, j, octant, max_radius, column + 1, start_slope, new_end_slope, add_walls, in_water);
                    start_slope = new_start_slope;
                    }
                else{
                    end_slope = new_end_slope;
                    end_row = min(ceil(end_slope*(column)), column);
                    }
                }
            else if (end_slope >= new_start_slope){
                start_slope = new_start_slope;
                }
            else{
                exit;
                }
            }
        }
    //ended column
    //stop if no area to scan
    if (start_slope > end_slope) exit;
    }
