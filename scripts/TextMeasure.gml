var text = argument0;
var max_width = argument1;

var lines;
var cur_line = 0;
lines[0] = "";

var word = "";
var index = 1;
do{
    var char = string_char_at(text, index);
    if (char == " "){
        //finished word
        if (lines[cur_line] != ""){
            lines[cur_line] += " ";
            }
        lines[cur_line] += word;
        word = "";
        }
    else{
        word += char;
        if (lines[cur_line] != ""){//no new line if line is empty
            if (string_width(lines[cur_line] + " " + word) > max_width){
                //start new line
                cur_line++;
                lines[cur_line] = "";
                }
            }
        }
    index++;
    }until(index > string_length(text));
    
if (word != ""){
    if (lines[cur_line] != ""){
        lines[cur_line] += " ";
        }
    lines[cur_line] += word;
    }
    
var new_text = "";
for(var n = 0; n <= cur_line; n++){
    new_text += lines[n];
    new_text += "#";
    }

return new_text;
