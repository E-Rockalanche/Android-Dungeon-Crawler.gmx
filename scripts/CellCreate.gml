var cell = instance_create(0, 0, obj_cell);
with(cell){
    i = argument0;
    j = argument1;
    }
instance_deactivate_object(cell);
return cell;
