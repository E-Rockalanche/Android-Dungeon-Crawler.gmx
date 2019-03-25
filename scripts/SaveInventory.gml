//write inventory data to buffer

var buf = argument0;
var inv = argument1;

var isize = ds_list_size(inv);
buffer_write(buf, buffer_u8, isize);
//ftwr_space(fout, isize);

for(var n = 0; n < isize; n++){
    SaveItem(buf, inv[| n]);
    }
