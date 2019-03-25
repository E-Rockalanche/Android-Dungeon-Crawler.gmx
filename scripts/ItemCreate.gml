var item = instance_create(0,0,obj_item);

item.depth_found = argument[0];

var category;
if (argument_count > 1){
    category = argument[1];
    }
else{
    category = choose(ITEM_CATEGORY.WEAPON, ITEM_CATEGORY.ARMOUR, ITEM_CATEGORY.RING, ITEM_CATEGORY.FOOD, ITEM_CATEGORY.POTION, ITEM_CATEGORY.SCROLL,
        ITEM_CATEGORY.WAND, ITEM_CATEGORY.GOLD, ITEM_CATEGORY.PROJECTILE);
    }

item.category = category;
var bl_category = BL(category);
    
if (bl_category & ~ITEM_IS_PREDEFINED){
    var type = 0;
    if (argument_count > 2){
        type = argument[2];
        }
    else{
        switch(category){
            case ITEM_CATEGORY.WEAPON:
                type = floor(random(WEAPON.LENGTH));
                break;
            /*
            case ITEM_CATEGORY.AMMO:
                type = floor(random(AMMO.LENGTH));
                break;
            */
            
            case ITEM_CATEGORY.PROJECTILE:
                type = floor(random(PROJECTILE.LENGTH));
                break;
            
            case ITEM_CATEGORY.ARMOUR:
                type = floor(random(ARMOUR.LENGTH));
                break;
            
            case ITEM_CATEGORY.RING:
                type = floor(random(RING.LENGTH));
                break;
            
            /*
            case ITEM_CATEGORY.FOOD:
                type = floor(random(FOOD.LENGTH));
                break;
            */
            
            case ITEM_CATEGORY.POTION:
                type = floor(random(POTION.LENGTH));
                break;
            
            case ITEM_CATEGORY.SCROLL:
                type = floor(random(SCROLL.LENGTH));
                break;
            
            case ITEM_CATEGORY.WAND:
                type = floor(random(WAND.LENGTH));
                break;
            
            default:
                ASSERT(false, "Unknown item category in ItemCreate()");
            }
        }
    item.type = type;
    }
    
var sprite = spr_error;
var index = 0;
switch(category){
    case ITEM_CATEGORY.WEAPON:
        sprite = spr_weapons;
        index = type;
        break;
        
    case ITEM_CATEGORY.ARMOUR:
        sprite = spr_armour;
        index = type;
        break;
            
    case ITEM_CATEGORY.PROJECTILE:
        sprite = spr_projectiles;
        index = type;
        break;
    
    case ITEM_CATEGORY.RING:
        sprite = spr_ring;
        index = type;
        break;
    
    case ITEM_CATEGORY.FOOD:
        sprite = spr_food;
        //index = type
        break;
    
    case ITEM_CATEGORY.POTION:
        sprite = spr_potion;
        index = type;
        break;
    
    case ITEM_CATEGORY.SCROLL:
        sprite = spr_scroll;
        index = type;
        break;
    
    case ITEM_CATEGORY.WAND:
        sprite = spr_wand;
        index = type;
        item.charges = 4;
        break;
    
    case ITEM_CATEGORY.GOLD:
        sprite = spr_gold;
        break;
    
    case ITEM_CATEGORY.KEY:
        sprite = spr_key;
        break;
    }
item.sprite = sprite;
item.img_index = index;
    
var quantity = 1;
if (bl_category & ITEM_CAN_STACK){
    if (argument_count > 3){
        quantity = argument[3];
        }
    else if (category == ITEM_CATEGORY.PROJECTILE){
        quantity = irandom_range(3, 8);
        }
    }
item.quantity = quantity;

instance_deactivate_object(item);
    
return item;
