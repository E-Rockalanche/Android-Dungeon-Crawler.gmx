var cur_floor = argument0;

var time = current_time;

instance_activate_object(cur_floor);
with(cur_floor){

    show_debug_message("----------------------------- FloorGenerateCave() -----------------------------");
    
    random_set_seed(seed);
    show_debug_message("Set seed to "+string(seed)+" for depth "+string(floor_depth));
    
    //initialize map
    map = MapInit(width, height);//sets map border to permanent
    
    
    var min_room_size = 7;
    var max_room_size = 13;
    
    var min_rooms = (width div (max_room_size + 1))*(height div (max_room_size + 1));
    var max_rooms = (width div (min_room_size + 1))*(height div (min_room_size + 1));
    
    min_rooms += 2;
    max_rooms -= 2;
    
    var num_treasure_rooms = irandom_range(1, 2);
    
    //create room list. Must have minimum amount of rooms or else remake room list
    var num_rooms, room_list;
    room_list = BSP(0, 0, width ,height, min_room_size, max_room_size, min_rooms, max_rooms);
    var num_rooms = ds_list_size(room_list)
    show_debug_message("Number of rooms: "+string(num_rooms));
    
    
    RoomListShift(room_list);
    
    RoomListCheck(room_list);
    
    for(var n = 0; n < ds_list_size(room_list); n++){
        RoomMakeCave(room_list[| n]);
        }
    //RoomListSetTypes(room_list);
    
    MapAddLakes(map, irandom(2));
    RoomListSet(room_list);
    
    show_debug_message("--- SETTING TREASURE ROOMS ---");
    var treasure_rooms = RoomListSetTreasureRooms(room_list, num_treasure_rooms);
    num_treasure_rooms = ds_list_size(treasure_rooms);
    
    
    //connect rooms
    //link regular rooms
    var link_list = LinkListCreate(room_list);
    //link treasure rooms
    for(var n = 0; n < num_treasure_rooms; n++){
        var room1 = treasure_rooms[| n];
        ds_list_add(link_list, LinkCreate(room1, RoomFindClosest(room1, room_list)));
        }
    /*
    if DEBUG{
        for(var n = 0; n < ds_list_size(link_list); n++){
            var link = link_list[| n];
            var room1 = link[? 0];
            var room2 = link[? 1];
            var line = path_add();
            path_set_closed(line, false);
            path_add_point(line, (room1[? ROOM.CENTER].i + 0.5)*GRID_SIZE, (room1[? ROOM.CENTER].j + 0.5)*GRID_SIZE, 1);
            path_add_point(line, (room2[? ROOM.CENTER].i + 0.5)*GRID_SIZE, (room2[? ROOM.CENTER].j + 0.5)*GRID_SIZE, 1);
            ds_list_add(outline_list, line);
            }
        }
    */
    
    show_debug_message("--- DIGGING HALLWAYS ---");
    //door chance = 60, perlin_spacing  4, perlin_coef = 100, perlin_floor = 0.5
    var hall_time = current_time;
    AstarConnectRooms(link_list, 60, 2, 60, 0.5);//destroys link_list, creates treasure room locks
    show_debug_message("*********Built hallways in "+string(current_time - hall_time)+" milliseconds");
    
    
    scr_clean_map();
    
    
    MapAddGrass(map);
    
    floor_list = ds_list_create();
    room_floor_list = ds_list_create();
    MapGetFloorLists(map, floor_list, room_floor_list);
    

    //place treasure room keys
    for(var n = 0; n < num_treasure_rooms; n++){
        var rm = treasure_rooms[| n];
        var key = rm[? ROOM.KEY];
        if (key != -1){
            var cell = ds_list_delete_return(room_floor_list, 0);
            CellAddItem(cell, key);
            }
        }
    
    
        
    
    //set stairs
    show_debug_message("SETTING STAIR LOCATIONS");
    stairs_up = ds_list_delete_return(room_floor_list, 0);
    CellSetTileTemp(stairs_up, TILE.STAIRS_UP);
    if (floor_depth < other.dungeon_size){
        stairs_down = ds_list_delete_return(room_floor_list, 0);
        CellSetTileTemp(stairs_down, TILE.STAIRS_DOWN);
        }
    
    
    show_debug_message("---- CALCULATING DJIKSTRA MAPS ---");
    scr_dijkstra_scans();
    
    RoomListSetFunPercent(room_list);
    
    RoomListDebugPrint(room_list);
    
    //add loot
    show_debug_message("ADDING ITEMS");
    repeat(floor(ds_list_size(room_floor_list)*5/100)){
        
        //only fire wands
        //CellAddItem(ds_list_delete_return(room_floor_list, 0), ItemCreate(floor_depth, ITEM_CATEGORY.WAND, WAND.FIRE));
        
        //only confusion potions
        //CellAddItem(ds_list_delete_return(room_floor_list, 0), ItemCreate(floor_depth, ITEM_CATEGORY.POTION, POTION.CONFUSION));
        
        //only potions and wands
        //CellAddItem(ds_list_delete_return(room_floor_list, 0), ItemCreate(floor_depth, choose(ITEM_CATEGORY.POTION, ITEM_CATEGORY.WAND)));
        
        //equal distribution of all items
        //CellAddItem(ds_list_delete_return(room_floor_list, 0), ItemCreate(floor_depth));
        RoomAddItem(GetFunRoom(room_list), ItemCreate(floor_depth));
        }
        
    //destroy rooms
    RoomListDestroy(room_list);
    RoomListDestroy(treasure_rooms);
    
        
    MapAddEnemies(map, 15);
        
        
    ds_list_destroy(floor_list);
    
    
    show_debug_message("SETTING WATER SPRITES");
    scr_set_water_sprites();
    
    
    show_debug_message("--- MAP COMPLETE ---");
    show_debug_message("Created "+string(num_rooms)+" rooms");
    show_debug_message("Created "+string(num_treasure_rooms)+" treasure rooms");
    
    show_debug_message("CREATING GAS GRIDS");
    gas_density_grid = ds_grid_create(width, height);
    gas_type_grid = ds_grid_create(width, height);
    }
instance_deactivate_object(cur_floor);

show_debug_message("created cave floor in "+string(current_time - time)+" milliseconds");
