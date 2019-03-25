//REMINDER: destroys second argument!!!!!

var item1, item2;
item1 = argument0;
item2 = argument1;

ASSERT(ItemsAreSame(item1, item2), ItemGetName(item1)+" and "+ItemGetName(item2)+" cannot merge");

item1.quantity += ItemQuantity(item2);

ItemDestroy(item2);

return item1;
