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
varying vec2 v_vPosition;

const float tau = 6.28318530718;

uniform vec3 size;
uniform float wavelength;
uniform float alpha;

void main()
{
    vec2 amplitude = vec2(size.z) / size.xy;
    
    vec2 coord = v_vTexcoord;
    
    vec2 norm = vec2(0.5 - coord.x, 0.5 - coord.y)*size.xy;
    float dist = length(norm);
    
    if (dist < wavelength){
        amplitude *= dist/wavelength;
        }
    
    coord += cos(alpha - dist*tau/wavelength)*amplitude*normalize(norm);
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, coord );
}
