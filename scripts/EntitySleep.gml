var entity = argument0;

entity.status_effect[STATUS.SLEEPING] = irandom_range_clump(1, 10, 2);
ds_list_delete_value(decide_list, entity);
