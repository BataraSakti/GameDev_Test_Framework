if(already_nuked == 0) {
    already_nuked = 1;
} else {
    exit;
}

if(text != ""){
    if(surface_sprite != 1 && surface_sprite != noone){
        sprite_delete(surface_sprite);
    }
}
ScheduleCancelTarget(id);
TweenDestroyTarget(id);

