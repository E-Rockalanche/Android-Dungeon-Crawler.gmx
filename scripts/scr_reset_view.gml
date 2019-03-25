//resets view and entities on current floor to not visible

for(var n = 0; n < ds_list_size(view_list); n++){
    var cell = view_list[| n];
    cell.in_view = false;
    }
ds_list_clear(view_list);

for(var n = 0; n < ds_list_size(entity_list); n++){
    var entity = entity_list[| n];
    entity.in_view = false;
    entity.was_in_view = false;
    }
