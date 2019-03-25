var entity = argument0;

for(var n = 0; n < STATUS.LENGTH; n++){
    if (entity.status_effect[n] >= 0){
        entity.status_effect[n]--;
        }
    }
