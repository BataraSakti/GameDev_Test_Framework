if(view_current == 1) {
	if(!only_text){
		if(!_nine_slice){
		    draw_sprite_ext(spr_marshman_shadow,0, x+(image_xscale*marsh_xoff), y+(image_yscale*marsh_yoff), image_xscale, image_yscale, 0, c_white, image_alpha);    
		    //draw_self();
			draw_sprite_ext(sprite_index, marshman_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha_0);
		}
		else{
			nine_slice_center(sprite_index, x, y, ns_width, ns_height, 2, 1);
		}
	}
	
	if(text != "") {
        if(do_ring == true) {
            draw_sprite_ext(spr_sunray_radial,0, x+(image_xscale*text_xoff), y+(image_yscale*text_yoff), image_xscale*0.45, image_yscale*0.45, global.rot, ring_color, image_alpha);
        }
        draw_set_halign(fn_halign);
        draw_set_valign(fn_valign);
		scp_set_font(fnt_normal);
        draw_text_outline_auto(x+(image_xscale*text_xoff), y+(image_yscale*text_yoff), text, b_c, f_c, 
            image_xscale*fn_sz, image_xscale*fn_sz, image_alpha,min(image_xscale*force_max, max(1,image_xscale*sprite_get_width(sprite_index)-10))+txt_width, px, true);
    }
	
	if(draw_hand){
		draw_sprite_ext(spr_hand_tap, image_index, x+30, y+30, image_xscale*0.9, image_yscale*0.9, 0, c_white, image_alpha_0);
    } 
}
