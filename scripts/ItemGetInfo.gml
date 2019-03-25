var item = argument0;

var category = ItemCategory(item);
var type = ItemType(item);

var text = "";
switch(category){
    case ITEM_CATEGORY.FOOD:
        text = "A balanced meal for any adventurer.";
        break;
    
    case ITEM_CATEGORY.KEY:
        text = "A key that can be used on the floor it was discovered.";
        break;
    
    case ITEM_CATEGORY.KEY_RING:
        text = "A ring used to hold many keys.";
        break;
    
    case ITEM_CATEGORY.GOLD:
        text = "The desire of most adventurers.";
        break;
    
    case ITEM_CATEGORY.ARMOUR:
        switch(type){
            case ARMOUR.PADDED:
                text = "A cloth jacket made of wool.";
                break;
            case ARMOUR.HIDE:
                text = "Armour made out of leather and animal skins.";
                break;
            case ARMOUR.LEATHER:
                text = "Leather body armour made to be light and flexible.";
                break;
            case ARMOUR.STUDDED:
                text = "Hardened leather with closely spaced metal studs.";
                break;
            case ARMOUR.CHAIN:
                text = "A heavy shirt made of linked metal rings.";
                break;
            case ARMOUR.SPLINT:
                text = "Narrow strips of metal fastened to a leather foundation.";
                break;
            case ARMOUR.LAMINAR:
                text = "Armour composed of overlapping bands of metal.";
                break;
            case ARMOUR.PLATE:
                text = "Armour built out of solid plates of steel. It turns the wearer into a slow but indestructable force.";
                break;
            }
        var defense = armour_index[type, ARMOUR_INDEX.DEFENSE];
        text += "#Protects against "+string(defense)+" points of damage";
        break;
    
    case ITEM_CATEGORY.PROJECTILE:
        switch(type){
            case PROJECTILE.ROCK:
                text = "A small stone that's easy to throw.";
                break;
            case PROJECTILE.DART:
                text = "A small projectile.";
                break;
            case PROJECTILE.BOOMERANG:
                text = "A shapped wooden projectile that always comes back.";
                break;
            case PROJECTILE.SHURIKEN:
                text = "A small razor sharp disk with spikes.";
                break;
            case PROJECTILE.THROWING_AXE:
                text = "A small axe for doing damage from a distance.";
                break;
            }
        var min_damage = projectile_index[type, PROJECTILE_INDEX.MIN_DAMAGE];
        var max_damage = projectile_index[type, PROJECTILE_INDEX.MAX_DAMAGE];
        text += "#Deals "+string(min_damage)+"-"+string(max_damage)+" base damage";
        break;
    
    case ITEM_CATEGORY.WEAPON:
        switch(type){
            case WEAPON.KNUCKLES:
                text = "A metal guard worn over the knuckles to increase melee damage.";
                break;
            case WEAPON.CLAW:
                text = "A handheld claw to attack foes like a beast.";
                break;
            case WEAPON.DAGGER:
                text = "A small blade meant for fast attacks or stealthy blows.";
                break;
            case WEAPON.SHORT_SWORD:
                text = "A small, quick sword for close encounters.";
                break;
            case WEAPON.LONG_SWORD:
                text = "A weapon for a true knight. It does more damage than a short sword.";
                break;
            case WEAPON.RAPIER:
                text = "A gentleman's weapon. Use it with finesse.";
                break;
            case WEAPON.WAR_AXE:
                text = "A one handed axe great for quick and deadly blows.";
                break;
            case WEAPON.CLUB:
                text = "A simple, but effective blunt weapon.";
                break;;
            case WEAPON.MACE:
                text = "A heavy blunt weapon that deals powerful blows.";
                break;
            case WEAPON.FLAIL:
                text = "A ball whirled on the end of a chain. It can defend the user from all sides.";
                break;
            case WEAPON.GREAT_SWORD:
                text = "A massive sword that is slow, but deals awesome damage.";
                break;
            case WEAPON.GREAT_AXE:
                text = "A massive two handed axe that can slay the mightiest of foes.";
                break;
            case WEAPON.WAR_HAMMER:
                text = "A massive hammer that will crush any who oppose it's wielder.";
                break;
            case WEAPON.HALBERD:
                text = "A versitile weapon used to pierce and slash";
                break;
            }
        var min_damage = weapon_index[type, WEAPON_INDEX.MIN_DAMAGE];
        var max_damage = weapon_index[type, WEAPON_INDEX.MAX_DAMAGE];
        text += "#Deals "+string(min_damage)+"-"+string(max_damage)+" base damage";
        break;
    
    case ITEM_CATEGORY.WAND:
        switch(type){
            case WAND.FIRE:
                text = "Shoots balls of fire to incinerate foes and terrain.";
                break;
            case WAND.MAGIC_MISSILE:
                text = "Shoots pure force at enemies that never misses.";
                break;
            case WAND.LIGHTNING:
                text = "Shoots a bolt of lightning that can damage groups of enemies.";
                break;
            case WAND.TELEPORTATION:
                text = "Teleports the target to a random location on the current floor.";
                break;
            case WAND.BLINKING:
                text = "Will teleport the caster to wherever the caster aims.";
                break;
            case WAND.REGROWTH:
                text = "Brings plant life to anywhere the caster aims.";
                break;
            case WAND.ICE:
                text = "Shoots ice cold wind to freeze foes and terrain.";
                break;
            case WAND.HEALING:
                text = "Heals the health of any target hit.";
                break;
            case WAND.DOMINATION:
                text = "Temporarily entrances the target to fight on the caster's side.";
                break;
            }
        text += "#Charges: "+string(WandCharges(item))+"/4";
        break;
    
    case ITEM_CATEGORY.POTION:
        switch(type){
            case POTION.HEALTH:
                text = "Heals the drinker.";
                break;
            case POTION.FIRE:
                text = "Will explode into a ball of fire if disturbed.";
                break;
            case POTION.STRENGTH:
                text = "Permanently invigorates the drinker.";
                break;
            case POTION.AGILITY:
                text = "Permanently increases the drinker's speed.";
                break;
            case POTION.CONFUSION:
                text = "Confuses any creature that breaths the gasses released by this concotion.";
                break;
            case POTION.POISON:
                text = "Poisons any creature that breaths the deadly gasses from this potion.";
                break;
            case POTION.PARALYSIS:
                text = "Paralyses any creature that breaths the gasses released from this potion.";
                break;
            }
        break;
    
    case ITEM_CATEGORY.SCROLL:
        switch(type){
            case SCROLL.MAGIC_MAPPING:
                text = "Reveals the current floor to whoever reads this scroll.";
                break;
            case SCROLL.RECHARGING:
                text = "Recharges all wands held by whoever reads this scroll.";
                break;
            case SCROLL.UPGRADE:
                text = "Can upgrade any upgradable item in the caster's inventory.";
                break;
            case SCROLL.LULLABY:
                text = "Puts all foes in view into a deep sleep.";
                break;
            }
        break;
    
    case ITEM_CATEGORY.RING:
        switch(type){
            case RING.STEALTH:
                text = "Makes it harder for foes to detect the wearer.";
                break;
            case RING.HEALTH:
                text = "Increases health regeneration rate of the wearer.";
                break;
            case RING.HUNGER:
                text = "Makes wearer get hungry slower.";
                break;
            case RING.SPEED:
                text = "Increases speed of the wearer.";
                break;
            case RING.PERCEPTION:
                text = "Makes it easier for the wearer to detect hidden things.";
                break;
            case RING.FURY:
                text = "Increases damage output from the wearer.";
                break;
            }
        break;
    
    default:
        text += "#***Default description***";
        break;
    }
return text;
