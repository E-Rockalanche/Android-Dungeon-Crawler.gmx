var index = argument[0];
var pos = argument[1];

for(var n = 2; n < argument_count; n++){
    index[@ pos, n-2] = argument[n];
    }
