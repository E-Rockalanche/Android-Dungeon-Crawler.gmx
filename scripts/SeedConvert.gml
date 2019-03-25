//max seed: 999,999,999
var seed_text = argument0;
var seed_array;
seed_array[8] = 0;
var seed_val = 0;
for(var n = 0; n < string_length(seed_text); n++){
    var num = ord(string_char_at(seed_text, n+1));
    var pow = floor(log10(num));
    for(var nn = 0; nn <= pow; nn++;){
        seed_array[(n+nn) mod 9] += (num div power(10,nn)) mod 10;
        }
    }
for(var n = 0; n < 9; n++){
    seed_val += seed_array[n]*power(10,n);
    }
return seed_val;
