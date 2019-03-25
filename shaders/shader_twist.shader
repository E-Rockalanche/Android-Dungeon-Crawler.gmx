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
// twist shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const float tau = 6.28318530718;

uniform vec2 size;
uniform float alpha;
uniform float wavelength;
uniform float amplitude;//angle

void main()
{
    
    vec2 coord = size*(v_vTexcoord - 0.5);
    float dist = length(coord);
    float source_angle;
    if (coord.y >= 0.0)
    {
        source_angle = acos((coord.x) / dist);
    }else{
        source_angle = tau - acos((coord.x) / dist);
    }
    
    float amp_angle = amplitude/(8.0 + dist);
    float theta = sin(alpha + dist/wavelength*tau)*amp_angle + source_angle;
    
    float xx = 0.5 + dist / size.x * cos(theta);
    float yy = 0.5 + dist / size.y * sin(theta);
    
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, vec2(xx,yy) );
}
