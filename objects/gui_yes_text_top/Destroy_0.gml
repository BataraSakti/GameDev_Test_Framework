//Clean up generated sprite
if(sprite_exists(new_spr)) {
    sprite_index = spr_tran;
    sprite_delete(new_spr);
}

event_inherited();

