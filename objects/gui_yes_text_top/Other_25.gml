
var surface = noone;
var h = sprite_get_height(temp_sprite);
var w = sprite_get_width(temp_sprite);
var w1 = sprite_get_width(spr_gui_unlocked_shader);
var ad_x = 0;
var ad_y = 0;
if(h/2+(p_yscale_start*text_yoff) > h){
    ad_y = text_yoff;
}else if(w/2+(p_xscale_start*text_xoff) > w){
    ad_x = text_xoff;
}

surface = surface_create(w1, h+ad_y);
surface_set_target(surface);
draw_clear_alpha(p_alpha_start, 0);

new_spr = sprite_create_from_surface(surface, 0, 0, w+ad_x, h+ad_y, false, true, w/2, h/2);
surface_reset_target();
scp_free_surface(surface);

sprite = new_spr;
press = new_spr;
sprite_index = new_spr;

return new_spr;



