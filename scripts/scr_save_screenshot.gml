var date_string = string(current_year)+string(current_month)+string(current_day)

var filename = date_string+"_"+seed_string+"_";
var foldername;

if creating_GIF{
    filename += string(num_GIFs)+"-"+string(GIF_image);
    foldername = "\gifs\"+date_string+"\"+seed_string+"\"+string(num_GIFs)+"\";
    GIF_image++;
    }
else{
    filename += string(num_screenshots);
    foldername = "\screenshots\"+date_string+"\";
    num_screenshots++;
    show_debug_message("Saved Screenshot");
    }
    
screen_save(working_directory + foldername + filename + ".png");
