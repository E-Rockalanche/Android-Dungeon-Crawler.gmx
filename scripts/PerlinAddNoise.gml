var noise, vec_size, coef;
noise = argument[0];
vec_size = argument[1];
coef = 1;
if (argument_count > 2){
    coef = argument[2];
    }
cutoff = 0;
if (argument_count > 3){
    cutoff = clamp(argument[3], 0, 1);
    }
    
if ((coef == 0) || (cutoff == 1)){
    exit;
    }

var vec_x = ds_grid_create(vec_size, vec_size);
var vec_y = ds_grid_create(vec_size, vec_size);

//randomize vectors
for(var i = 0; i < vec_size; i++){
    for(var j = 0; j < vec_size; j++){
        var angle = random(2*pi);
        vec_x[# i,j] = cos(angle);
        vec_y[# i,j] = sin(angle);
        }
    }
    
var grid_width = ds_grid_width(noise);
var grid_height = ds_grid_height(noise);
    
//add noise
for(var i = 0; i < grid_width; i++){
    for(var j = 0; j < grid_height; j++){
        //calculate transformed position
        var ii = i*vec_size/grid_width;
        var jj = j*vec_size/grid_height;
        
        //calculate dstance from corners to pos
        var dl = ii mod 1;
        var dt = jj mod 1;
    
        //calculate vector position
        var xl = floor(ii);
        var xr = (xl+1) mod vec_size;
        var yt = floor(jj);
        var yb = (yt+1) mod vec_size;
        
        //calculate corner values
        var vtl = dot_product(vec_x[# xl, yt], vec_y[# xl, yt], dl, dt);//top left
        var vtr = dot_product(vec_x[# xr, yt], vec_y[# xr, yt], dl-1, dt);//top right
        var vbl = dot_product(vec_x[# xl, yb], vec_y[# xl, yb], dl, dt-1);//bottom left
        var vbr = dot_product(vec_x[# xr, yb], vec_y[# xr, yb], dl-1, dt-1);//bottom right
        
        //calculate value
        var x_tween = 3*dl*dl - 2*dl*dl*dl;
        var y_tween = 3*dt*dt - 2*dt*dt*dt;
        var top = vtl + x_tween*(vtr - vtl);
        var bottom = vbl + x_tween*(vbr - vbl);
        var value = (1 + clamp(top + y_tween*(bottom - top), -1, 1))/2;
        value = clamp((value-cutoff)/(1 - cutoff), 0, 1);//change value to be 0-1 between floor and 1
        noise[# i,j] += coef*value;
        }
    }
    
ds_grid_destroy(vec_x);
ds_grid_destroy(vec_y);
