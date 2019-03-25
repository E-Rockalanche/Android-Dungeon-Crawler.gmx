shader_index = (shader_index + 1) mod num_shaders;
    switch(shader_index){
        case 0:
            shader = shader_bypass;
            shader_name = "bypass";
            break;
        
        case 1:
            shader = shader_grayscale;
            shader_name = "grayscale";
            break;
        
        case 2:
            shader = shader_sepia;
            shader_name = "sepia";
            break;
        
        case 3:
            shader = shader_invert;
            shader_name = "invert";
            break;
        
        case 4:
            shader = shader_radial_blur;
            shader_name = "radial blur";
            break;
        
        case 5:
            shader = shader_gaussian_blur;
            shader_name = "gaussian blur";
            break;
        
        case 6:
            shader = shader_bloom;
            shader_name = "bloom";
            break;
        
        case 7:
            shader = shader_glow;
            shader_name = "glow";
            break;
        
        case 8:
            shader = shader_contrast;
            shader_name = "contrast";
            break;
        
        case 9:
            shader = shader_wave;
            shader_name = "wave";
            break;
        
        case 10:
            shader = shader_lsd;
            shader_name = "lsd";
            break;
        
        case 11:
            shader = shader_ripple;
            shader_name = "ripple";
            break;
        
        case 12:
            shader = shader_bubble;
            shader_name = "bubble";
            break;
        
        case 13:
            shader = shader_twist;
            shader_name = "twist";
            break;
        
        case 14:
            shader = shader_radial_ripple;
            shader_name = "radial ripple";
            break;
        
        case 15:
            shader = shader_big_pixels;
            shader_name = "big pixels";
            break;
        
        case 16:
            shader = shader_pixelate;
            shader_name = "pixelate";
            break;
        
        case 17:
            shader = shader_gameboy;
            shader_name = "gameboy";
            break;
        
        case 18:
            shader = shader_8bit;
            shader_name = "8bit";
            break;
        
        case 19:
            shader = shader_rgb_bleed;
            shader_name = "rgb bleed";
            break;
        }
