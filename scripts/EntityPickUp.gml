var entity = argument0;

ASSERT(entity != -1, "No entity in EntityPickUpItem()");

var entity_name = EntityGetName(entity)

show_debug_message("EntityPickUpItem( "+entity_name+" )");
    
var items = (entity.cell).items;
if (ds_list_size(items) > 0){
    if InventoryCanAddItem(entity.inventory, items[| 0]){
        entity.action_alarm = 1;
        entity.action = ENTITY_ACTION.PICK_UP;
        scr_action_start();
        return true;
        }
    }
    
show_debug_message("There are no items for "+entity_name+" to pick up");
return false;
