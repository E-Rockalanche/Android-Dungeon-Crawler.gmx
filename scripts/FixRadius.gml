var radius = argument0;
switch(radius){
    case 1:
        return 0.8;
    case 1.5:
        return 1;
    case 2:
        return 1.6;
    case 2.5:
        return 2.3;
    case 3:
        return 2.6;
    case 3.5:
        return 3.2;
    case 4:
        return 3.54;
    case 4.5:
        return 4.3;
    case 5:
        return 4.4;
    default:
        return radius - 0.2;
    }
