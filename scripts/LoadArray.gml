var buf = argument0;
var asize = argument1;

var a;
a[asize-1] = 0;

for(var n = 0; n < asize; n++){
    a[n] = buffer_read(buf, buffer_s32);
    //a[n] = file_text_read_real(fin);
    }
return a;
