//executed by obj_entity

ASSERT(action_item != -1, "item does not exist in scr_entity_read()");

switch(ItemType(action_item)){
    case SCROLL.UPGRADE:
        break;
    
    case SCROLL.RECHARGING:
        for(var n = 0; n < ds_list_size(inventory); n++){
            var item = inventory[| n];
            if (ItemCategory(item) == ITEM_CATEGORY.WAND){
                item.charges = 4;
                }
            }
        break;
        
    case SCROLL.MAGIC_MAPPING:
        break;
        
    case SCROLL.LULLABY:
        var view = ds_list_create();
        with(obj_game){
            FOVGetList(view, other.i, other.j, EntityGetViewDistance(other), true, (other.cell.tile == TILE.WATER));
            }
        for(var n = 0; n < ds_list_size(view); n++){
            var cell = view[| n];
            var target = cell.entity;
            if (target != -1){
                if (target != id){
                    EntitySleep(target);
                    }
                }
            }
        ds_list_destroy(view);
        break;
    }
    
var item = InventoryDeplete(inventory, action_item, 1);
ItemDestroy(item);

turn_timer = 1;
scr_action_end();
