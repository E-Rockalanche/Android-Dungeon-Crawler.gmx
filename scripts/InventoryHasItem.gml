var inventory = argument[0];

var category = -1;
var type = -1;

if (argument_count > 1){
    category = argument[1];
    if (argument_count > 2){
        type = argument[2];
        }
    }

for(var n = 0; n < ds_list_size(inventory); n++){
    var item = inventory[| n];
    
    if (category == -1){
        return item;
        }
    else if (category == ItemCategory(item)){
        if ((type == -1) || (type == ItemType(item))){
            return item;
            }
        }
    }
    
return -1;
