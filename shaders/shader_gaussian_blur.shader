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

const int QUALITY = 8;
const int DIRECTIONS = 16;
const float tau = 6.28318530718;

uniform vec3 size;//width, height, blur radius

void main()
{
    vec2 radius = size.z/size.xy;
    vec4 colour;
    for(float d = 0.0; d < tau; d += tau/float(DIRECTIONS))
    {
        for(float i = 0.0; i < 1.0; i += 1.0/float(QUALITY))
        {
            colour += texture2D( gm_BaseTexture, v_vTexcoord + vec2(cos(d), sin(d))*i*radius);
        }
    }
    gl_FragColor = v_vColour * colour/(float(QUALITY)*float(DIRECTIONS));
}
