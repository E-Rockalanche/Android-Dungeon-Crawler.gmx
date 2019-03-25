var button = argument0;

var left = button[? BUTTON.X];
var top = button[? BUTTON.Y];
var width = button[? BUTTON.WIDTH];
var height = button[? BUTTON.HEIGHT];

var mx = left + width/2;
var my = top + height/2;

//draw background
//draw_set_alpha(1);

if ds_map_exists(button, BUTTON.ITEM){
    var item = button[? BUTTON.ITEM];
    var colour;
    if ItemIsEquipped(item, obj_game.player){
        colour = c_yellow;
        }
    else{
        colour = c_ltgray;
        }
    draw_rectangle_colour(left, top, left+width, top+height, colour, colour, colour, colour, false);

    //draw sprite
    var alpha = ((1 + button[? BUTTON.ENABLED])/2);
    var sprite = ItemSprite(item);
    draw_sprite_ext(sprite, ItemIndex(item), mx, my, 1, 1, 0, c_white, alpha);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_colour(c_black);
    draw_text(left, top, string(ItemQuantity(item)));
    }
else{
    var colour = c_ltgray;
    draw_rectangle_colour(left, top, left+width, top+height, colour, colour, colour, colour, false);
    
    //draw text
    var alpha = ((1 + button[? BUTTON.ENABLED])/2);
    var colour = c_black;
    var text = button[? BUTTON.TEXT];
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_transformed_colour(mx, my, text, 1, 1, 0, colour, colour, colour, colour, alpha);
    }
    
    
    
    
    
    
    
    
