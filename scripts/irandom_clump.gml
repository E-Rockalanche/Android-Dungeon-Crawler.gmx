var rem = argument0;
var clumps = argument1;

var num = 0;
do{
    var cur = rem div clumps;
    num += irandom(cur);
    rem = rem - cur;
    clumps--;
    }until(clumps == 0);
    
return num;
