var entity = argument0;

instance_activate_object(entity);

with(entity){
    InventoryDestroy(inventory);
    instance_destroy();
    }
