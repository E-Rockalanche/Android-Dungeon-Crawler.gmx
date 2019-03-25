var str = argument0;

var length = string_length(str);

var fun = "";
var fun_length = 0;

var pos = 1;
do{
    var char = string_char_at(str, pos);
    if (char != ' '){
        fun += char;
        fun_length++;
        }
    pos++;
    }until(((char == ' ') && (fun_length > 0)) || (pos > length));
    
return fun;
