var item = argument0;
var copy = instance_create(0,0,obj_item);

copy.depth_found = item.depth_found;
copy.quantity = item.quantity;
copy.category = item.category;
copy.identified = item.identified;
copy.type = item.type;
copy.enchantment = item.enchantment;
copy.level = item.level;
copy.charges = item.charges;
copy.sprite = item.sprite;
copy.img_index = item.img_index;

instance_deactivate_object(copy);

return copy;
