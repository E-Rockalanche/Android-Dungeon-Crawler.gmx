var i = argument0;
var j = argument1;
var left = argument2;
var top = argument3;
var width = argument4;
var height = argument5;

if (i >= left){
    if (j >= top){
        if (i < (left + width)){
            if (j < (top + height)){
                return true;
                }
            }
        }
    }
return false;
