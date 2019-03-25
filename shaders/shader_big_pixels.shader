//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 size;

const int PIXELSIZE = 6;

void main()
{
    vec2 pcoord = floor(v_vTexcoord*size);
    vec2 topleft = floor(pcoord / 3.0) * 3.0;
    vec4 colour;
    
    if (mod(pcoord.y, float(PIXELSIZE)) != 0.0){
        //not a scanline
        colour = vec4(0.0);
        
        for(int i = 0; i < PIXELSIZE; i++){
            for(int j = 0; j < PIXELSIZE; j++){
                colour += v_vColour * texture2D( gm_BaseTexture, (topleft + vec2(float(i), float(j))) / size);
                }
            }
        
        colour /= float(PIXELSIZE*PIXELSIZE);
        
        int hue = (int(mod(pcoord.x, float(PIXELSIZE))) * 3) / PIXELSIZE;
        if (hue == 0){
            //red
            colour *= vec4(1.0, 0.0, 0.0, 1.0);
        }else if (hue == 1){
            //green
            colour *= vec4(0.0, 1.0, 0.0, 1.0);
        }else{
            //blue
            colour *= vec4(0.0, 0.0, 1.0, 1.0);
            }
        }
    else{
        //scanline
        colour = vec4(0.0, 0.0, 0.0, 1.0) * v_vColour * texture2D( gm_BaseTexture, v_vTexcoord);
        }
    
    gl_FragColor = colour;
}

