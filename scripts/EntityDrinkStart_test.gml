var entity = argument0;
var potion = argument1;

var action = ActionCreate();
with(action){
    id.entity = entity;
    action_type = ACTION.DRINK;
    item = potion;
    }
    
entity.sprite_index = entity.sprite_drink;
entity.img_index = 0;
entity.image_speed = 15/room_speed;
entity.action_alarm = round(sprite_get_number(entity.sprite_drink)/entity.image_speed);

game_state = GAME_STATE.ANIMATION;
