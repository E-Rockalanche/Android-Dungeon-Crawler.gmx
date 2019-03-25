//list returns free cell and also removes any found unfree cells

var list = argument0;
var cell;
do{
    cell = ds_list_delete_return(list, 0);
    }until(cell.entity == -1);
return cell;
