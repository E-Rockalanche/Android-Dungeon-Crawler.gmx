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

const float QUALITY = 8;

uniform vec3 size;
uniform bool hor;

void main()
{
    vec2 radius = size.z/size.xy;
    vec4 source = texture2D( gm_BaseTexture, v_vTexcoord );
    
    vec4 shade = vec4(0);
    
    float min_dist = QUALITY;
    for(float i = -QUALITY; i <= QUALITY; i++){
        vec4 colour = texture2D( gm_BaseTexture, v_vTexcoord + vec2(i*(hor),j*(!hor))*radius/QUALITY);
        if ((abs(i) < min_dist) && (colour.a > source.a)){
            shade = colour;
            min_dist = abs(i);
            shade.a *= min_dist/QUALITY;
            }
        }
    
    gl_FragColor = vec3(source.rgb*source.a*(1.0 - shade.a) + shade.rgb*shade.a, source.a*(1-shade.a) + shade.a);
}

