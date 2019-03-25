//write path stack to buffer

var buf = argument0;
var stack = argument1;

var size = ds_stack_size(stack);
buffer_write(buf, buffer_u16, size);
//ftwr_space(fout, size);

//save x,y positions
if (size > 0){
    var a;
    a[size*2-1] = 0;
    for(var n = 0; n < size*2; n += 2){
        var cell = ds_stack_pop(stack);
        a[n] = cell.i;
        a[n+1] = cell.j;
        }
    for(var n = size*2-1; n >= 0; n--){
        buffer_write(buf, buffer_u8, a[n]);//save coordinates
        //ftwr_space(fout, a[n]);
        }
    }
