if(view_current == 1) {	
    //Allows for buttons to have a base size bigger than the sprite itself... 
    var t_xscale = (image_xscale*base_xscale);
    var t_yscale = (image_yscale*base_yscale);
    
    if(do_sunray == 1){
        draw_sprite_ext(spr_sunray_radial, 0, x, y, p_xscale_start*p_xscale_spin_base,
             p_yscale_start*p_xscale_spin_base, global.rot, c_white, image_alpha);
    }
    if(draw_spr && sprite_exists(sprite_index)) {
		if(!use_nineslice){
			draw_sprite_ext(sprite_index, image_index, x, y, t_xscale, t_yscale , image_angle, image_blend, image_alpha);
		} else {
			nine_slice_center(sprite_index, x, y, width*t_xscale, height*t_yscale, image_index, image_alpha, image_blend);
		}
	}
    
    if(icon != noone && sprite_exists(icon)) {
        var hh = sprite_get_height(sprite_index) - 16*t_xscale;
        if(text != "" && draw_texts) {
            draw_set_halign(fn_halign);
            draw_set_valign(fn_valign);
			scp_set_font(m_draw_font);
            if(iconRight == 0 && iconLeft == 1){
                var xff = (hh*0.5*t_xscale) + 6*t_xscale - 60;
            } else {
                var xff = (hh*0.5*t_xscale) + 6*t_xscale;
            }
			
            var nx_tx_sz = t_xscale*max_text_scale;
	        draw_text_outline_auto(x+xff+text_xoff,y+text_yoff, text, b_c, f_c, nx_tx_sz*scale_text, nx_tx_sz*scale_text, 
	            image_alpha,max(1,t_xscale*sprite_get_width(sprite_index)-(40+hh+12*t_xscale)),
	                out_line_px,soft_outline, scale_text);
        } 
        
        if(iconRight == 0 && iconLeft == 1){
            var xx = (x + (sprite_get_width(sprite_index) * 0.5 * t_xscale)) + 6*t_xscale - 65;
        } else {
            var xx = (x - (sprite_get_width(sprite_index) * 0.5 * t_xscale)) + 6*t_xscale;
        }
        
        var xx = (x - (sprite_get_width(sprite_index) * 0.5 * t_xscale)) + 6*t_xscale;
        var yy = (y - (sprite_get_height(sprite_index) * 0.5 * t_yscale)) + 5*t_yscale;
		
        draw_sprite_stretched_ext(icon, 0, xx+icon_xoff,yy+icon_yoff,hh*t_xscale*icon_xscale,hh*t_yscale*icon_yscale, c_white, image_alpha);
    } else {
        oscp_text_draw_for_buttons();
    }
}

