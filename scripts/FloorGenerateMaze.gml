var cur_floor = argument0;

var time = current_time;

instance_activate_object(cur_floor);
with(cur_floor){

    show_debug_message("----------------------------- FloorGenerateMaze() -----------------------------");
    
    random_set_seed(seed);
    show_debug_message("Set seed to "+string(seed)+" for depth "+string(floor_depth));
    
    //initialize map
    map = MapInit(width, height);//sets map border to permanent
    
    var min_room_size = 5;
    var max_room_size = 11;
    min_rooms = 2;//3
    max_rooms = 2;//5
    //create room list. Must have minimum amount of rooms or else remake room list
    var num_rooms, room_list;
    
    room_list = BSP(0, 0, width ,height, min_room_size, max_room_size, min_rooms, max_rooms);
    RoomListSetTypes(room_list);
    var link_list = LinkListCreate(room_list);
    MapAddLakes(map, irandom(2));
    ds_list_destroy(MapMakeMaze(map));
    RoomListSet(room_list);
    //door chance = 0, perlin_spacing  0, perlin_coef = 0, perlin_floor = 0
    AstarConnectRooms(link_list, 0, 0, 0, 0);//destroys link_list, creates treasure room locks
    scr_clean_map();
    MapAddGrass(map);
    
    var floor_list = ds_list_create();
    var room_floor_list = ds_list_create();
    MapGetFloorLists(map, floor_list, room_floor_list);
        
    
    //set stairs
    show_debug_message("SETTING STAIR LOCATIONS");
    stairs_up = ds_list_delete_return(room_floor_list, 0);
    CellSetTileTemp(stairs_up, TILE.STAIRS_UP);
    if (floor_depth < other.dungeon_size){
        stairs_down = ds_list_delete_return(room_floor_list, 0);
        CellSetTileTemp(stairs_down, TILE.STAIRS_DOWN);
        }
    
    //add loot
    show_debug_message("ADDING ITEMS");
    repeat(floor(ds_list_size(floor_list)*5/100)){
        //only fire wands
        //CellAddItem(ds_list_delete_return(room_floor_list, 0), ItemCreate(floor_depth, ITEM_CATEGORY.WAND, WAND.FIRE));
        
        //only confusion potions
        //CellAddItem(ds_list_delete_return(room_floor_list, 0), ItemCreate(floor_depth, ITEM_CATEGORY.POTION, POTION.CONFUSION));
        
        //only potions and wands
        //CellAddItem(ds_list_delete_return(room_floor_list, 0), ItemCreate(floor_depth, choose(ITEM_CATEGORY.POTION, ITEM_CATEGORY.WAND)));
        
        //equal distribution of all items
        CellAddItem(ds_list_delete_return(floor_list, 0), ItemCreate(floor_depth));
        }
    
        
    MapAddEnemies(map, 15);
        
        
    ds_list_destroy(floor_list);
    ds_list_destroy(room_floor_list);
    
    
    show_debug_message("SETTING WATER SPRITES");
    scr_set_water_sprites();
    
    
    show_debug_message("---- CALCULATING DJIKSTRA MAPS ---");
    scr_dijkstra_scans();
    
    
    show_debug_message("--- MAP COMPLETE ---");
    
    show_debug_message("CREATING GAS GRIDS");
    gas_density_grid = ds_grid_create(width, height);
    gas_type_grid = ds_grid_create(width, height);
    }
instance_deactivate_object(cur_floor);

show_debug_message("created maze floor in "+string(current_time - time)+" milliseconds");
