//executed by obj_entity

var entity_name = EntityGetName(id);

show_debug_message("EntityPickUpItem( "+entity_name+" )");
    
var items = cell.items;

ASSERT((ds_list_size(items) > 0), "No items on ground in scr_entity_pick_up()");

var item = items[| 0];
var item_name = ItemGetName(item);
var quantity = ItemQuantity(item);

if ((state = ENTITY_STATE.PLAYER) && (ItemCategory(item) == ITEM_CATEGORY.GOLD)){
    //gold does not need an inventory slot fro the player
    show_debug_message("Player picked up "+string(quantity)+" gold");
    gold += quantity;
    ds_list_delete(items, 0);
    ItemDestroy(item);
    audio_play_sound(snd_gold, 0, false);
    }
else if InventoryAdd(inventory, item){
    //item was added
    ds_list_delete(items, 0);
    show_debug_message(entity_name+" picked up "+string(quantity)+" "+item_name);
    audio_play_sound(snd_item, 0, false);
    }
else{
    ASSERT(false, "***ERROR: "+entity_name+" could not pick up "+item_name);
    }
    
if (ds_list_size(items) == 0){
    with(obj_game){
        ds_list_delete_value(item_list, other.cell);
        }
    }
action = ENTITY_ACTION.PICK_UP;
scr_action_end();
turn_timer = 1;
