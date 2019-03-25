//determines wether the entity is visible by the player or not

var entity = argument[0];
var in_view = false;

if (argument_count > 1){
    in_view = argument[1];
    }
else{
    var size = entity.size;
    for(var n = 0; n < size*size; n++){
        var i = entity.i + (n mod size);
        var j = entity.j + (n div size);
        var cell = map[# i,j];
        if cell.in_view{
            in_view = true;
            }
        }
    }

if in_view{
    //is in view this turn
    //show_debug_message(EntityGetName(entity)+" is in view");

    if !(entity.in_view || entity.was_in_view){
        //entity has come into view
        if EntityIsEnemy(entity){
            //show_debug_message("Enemy came into view. Autmove set to false");
            player_automove = false;
            }
            
        switch(entity.state){
            case ENTITY_STATE.DORMANT:
                EntitySetActive(entity);
                break;
            /*
            case ENTITY_STATE.WANDERING:
            case ENTITY_STATE.SEARCHING:
                EntityNoticePlayer(entity);
                break;
            */
            }
        }
    
    entity.in_view = true;
    entity.was_in_view = false;
    }
else if entity.in_view{
    //was in view last turn
    //show_debug_message(EntityGetName(entity)+" is no longer visible");

    entity.in_view = false;
    entity.was_in_view = true;
    }
else if entity.was_in_view{
    //out of view twice
    //show_debug_message(EntityGetName(entity)+" is out of sight");

    entity.was_in_view = false;
    }
