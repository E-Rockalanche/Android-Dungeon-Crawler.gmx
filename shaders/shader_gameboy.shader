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
// Gameboy palette shader with dithering
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 size;

void main()
{
    vec4 colour = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    
    vec2 pos = floor(v_vTexcoord*size / 2.0);
    
    vec3 c0 = vec3(15.0, 56.0, 15.0) / 255.0;
    vec3 c1 = vec3(48.0, 98.0, 48.0) / 255.0;
    vec3 c2 = vec3(139.0, 172.0, 15.0) / 255.0;
    vec3 c3 = vec3(155.0, 188.0, 15.0) / 255.0;
    
    vec3 lum = vec3(0.299, 0.587, 0.114);
    
    float s_lum = dot(colour.rgb, lum);
    
    float lum0 = dot(c0, lum);
    float lum1 = dot(c1, lum);
    float lum05 = (lum1 - lum0) / 2.0 + lum0;
    float lum2 = dot(c2, lum);
    float lum15 = (lum2 - lum1) / 2.0 + lum1;
    float lum3 = dot(c3, lum);
    float lum25 = (lum3 - lum2) / 2.0 + lum2;
    
    if (s_lum < (lum0*2.0 + lum05)/2.0){
        //lum0
        colour.rgb = c0;
    }else if (s_lum < (lum05*2.0 + lum1)/2.0){
        //lum0.5
        if (mod(pos.x + pos.y, 2.0) == 0.0){
            colour.rgb = c0;
        }else{
            colour.rgb = c1;
            }
    }else if (s_lum < (lum1*2.0 + lum15)/2.0){
        //lum1
        colour.rgb = c1;
    }else if (s_lum < (lum15*2.0 + lum2)/2.0){
        //lum15
        if (mod(pos.x + pos.y, 2.0) == 0.0){
            colour.rgb = c1;
        }else{
            colour.rgb = c2;
            }
    }else if (s_lum < (lum2*2.0 + lum25)/2.0){
        //lum2
        colour.rgb = c2;
    }else if (s_lum < (lum25*2.0 + lum3)/2.0){
        //lum25
        if (mod(pos.x + pos.y, 2.0) == 0.0){
            colour.rgb = c2;
        }else{
            colour.rgb = c3;
            }
    }else{
        //lum3
        colour.rgb = c3;
    }
    
    gl_FragColor = colour;
}

