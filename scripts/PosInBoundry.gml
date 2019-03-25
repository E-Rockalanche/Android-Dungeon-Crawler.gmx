var i = argument0;
var j = argument1;
var left = argument2;
var top = argument3;
var right = argument4;
var bottom = argument5;

if (i >= left){
    if (j >= top){
        if (i <= right){
            if (j <= bottom){
                return true;
                }
            }
        }
    }
return false;
