var entity, start, goal, open_list, closed_list, avoid_entities, it;

//only do Astar pathfinding for size1 entities

entity = argument0;
start = entity.cell;
goal = argument1;

var entity_is_player = (entity == player);

ASSERT(entity != -1, "No entity in AstarFindPath");
ASSERT(entity.size == 1, "Trying to Astar for entity "+EntityGetName(entity)+" of size "+string(entity.size));

var permissions = entity.permissions;

start.G = 0;
start.H = AstarGetHCost(start, goal);
start.F = start.H;

open_list = ds_priority_create();
ds_priority_add(open_list, start, start.F);
closed_list = ds_list_create();
        
var new_cell, on_goal, ii, jj, new_G, cur_entity, new_H, cur_cell, i, j, d, cur_G;
    
while(ds_priority_size(open_list) > 0)
    {
    cur_cell = ds_priority_delete_min(open_list);
    i = cur_cell.i;
    j = cur_cell.j;
    cur_G = cur_cell.G;
    
    cur_cell.closed = true;
    cur_cell.open = false;
    ds_list_add(closed_list, cur_cell);
        
    if (cur_cell == goal){
        AstarResetOpenList(open_list);
        AstarResetClosedList(closed_list);
        
        return true;
        }
    
    for(d = 0; d < 8; ++d){
        ii = i + dirs[d,0];
        jj = j + dirs[d,1];
        
        if ((ii < 0) || (jj < 0) || (ii >= map_width) || (jj >= map_height)){
            //entity would be out of map boundries
            continue;
            }
        
        new_cell = map[# ii,jj];
        
        on_goal = (new_cell == goal);
        
        if (new_cell.closed || (!/*EntityPosPermissible(entity, ii, jj)*/permissions[new_cell.tile] && !on_goal)
            || !EntityDiagFree(entity, cur_cell, new_cell) || (entity_is_player && !new_cell.discovered)
            || (!entity_is_player && !new_cell.in_view)){
            //cell is checked, (non-permissable and not on goal), or (not diagonal free)
            //player cannot pathfind through undiscovered area
            //AI cannot pathfind out of player's sight (to avoid lag spikes. Perhaps AI should have a limited pathfinding range instead)
            continue;
            }
        
        new_G = cur_G + 10 + 4*(d mod 2);//adj=10, diag=14
        
        if (new_cell.entity != -1){
            if !on_goal{
                new_G += ASTAR_ENTITY_COST;
                }
            }
        
        if (!new_cell.open || (new_G < new_cell.G)){
            new_cell.G = new_G;
            //var new_H = AstarGetHCost2(start, goal, new_cell);
            new_H = AstarGetHCost(goal, new_cell);
            new_cell.H = new_H;
            new_cell.F = new_G + new_H;
            new_cell.parent = cur_cell;
            
            /*
            if new_cell.closed{
                ds_list_delete_value(closed_list, new_cell);
                new_cell.closed = false;
                }
            */
            if !new_cell.open{
                ds_priority_add(open_list, new_cell, new_cell.F);
                new_cell.open = true;
                }
            else{
                ds_priority_change_priority(open_list, new_cell, new_cell.F);
                }
            }
        }
    }

AstarResetOpenList(open_list);
AstarResetClosedList(closed_list);

show_debug_message("AstarFindPath() failed to find the goal node");

return false;
