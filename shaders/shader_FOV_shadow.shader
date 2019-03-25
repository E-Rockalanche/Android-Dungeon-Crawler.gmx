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

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const float QUALITY = 15.0;
const float tau = 6.28318530718;

uniform vec3 size;//width, height, blur radius

void main()
{   vec4 source = texture2D(gm_BaseTexture, v_vTexcoord);
    
    vec4 total_colour = vec4(0.0);

    float div_by = 0.0;
    
    vec2 size_factor = size.z/(size.xy);
    
    
    for(float d = 0.0; d < tau; d += tau/8.0)
    {
        vec4 max_colour = vec4(0.0);
        for(float i = 0.0; i <= 1.0; i += 1.0/float(QUALITY))
        {
            vec4 cur_colour = texture2D(gm_BaseTexture, v_vTexcoord + vec2(cos(d),sin(d))*i*size_factor);
            if (cur_colour.a > source.a)
            {
                cur_colour *=  1.0 - i;
                if (cur_colour.a > max_colour.a)
                {
                    max_colour = cur_colour;
                }
            }
        }
        total_colour += max_colour;
    }
    
    gl_FragColor = vec4(source.rgb*(1.0 - total_colour.a) + total_colour.rgb*total_colour.a, source.a + total_colour.a);
}
