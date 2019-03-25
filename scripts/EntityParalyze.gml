var entity = argument0;
var time = argument1;

entity.status_effect[STATUS.PARALYZED] = time;
ds_list_delete_value(decide_list, entity);
