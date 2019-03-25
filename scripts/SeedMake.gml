// ascii 32 to 126

var text = "";
repeat(irandom_range(1,9)){
    text += chr(irandom_range(48, 57));
    }
show_debug_message("Generated seed: " + text);
return text;
