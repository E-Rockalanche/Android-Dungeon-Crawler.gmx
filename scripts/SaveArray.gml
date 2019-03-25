//write array to buffer

var buf = argument0;
var a = argument1;
var asize = argument2;

for(var n = 0; n < asize; n++){
    buffer_write(buf, buffer_s32, a[n]);
    //file_text_write_string(fout, string_format(a[n], 10, 0)+" ");
    }
