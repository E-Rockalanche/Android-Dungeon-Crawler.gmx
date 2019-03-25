var damage = argument2;

var colour;
if (damage > 0){
    colour = c_red;
    }
if (damage == 0){
    colour = c_white;
    }
else if (damage < 0){
    colour = c_green;
    }

SplashText(argument0, argument1, string(damage), colour);
