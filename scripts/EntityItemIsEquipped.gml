var entity = argument0;
var item = argument1;

return (
    (item == entity.weapon[0]) || 
    (item == entity.weapon[1]) || 
    (item == entity.armour) || 
    (item == entity.ring1) || 
    (item == entity.ring2)
    );
