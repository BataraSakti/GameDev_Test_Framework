if(view_current == 1) {    
 /*   if(icon != noone && sprite_exists(icon)) {
        draw_self();
        var hh = sprite_get_height(sprite_index) - 16*image_xscale;
        if(text != "") {
            draw_set_halign(fn_halign);
            draw_set_valign(fn_valign);
            var xff = (hh*0.5*image_xscale) + 6*image_xscale;
			draw_sprite_ext(spr_btn_bar_red, 0, x+xff+20,y, image_xscale*icon_scale_multiplier, image_yscale*icon_scale_multiplier, 0, c_white, image_alpha);
            draw_text_outline_auto(x+xff,y,text, b_c, f_c, image_xscale*1, image_xscale*1,
                image_alpha,max(1,image_xscale*sprite_get_width(sprite_index)-(30+hh+12*image_xscale))*finish_scale,out_line_px,soft_outline);
			} 
        var xx = (x - (sprite_get_width(sprite_index) * 0.5 * image_xscale)) + 6*image_xscale;
        var yy = (y - (sprite_get_height(sprite_index) * 0.5 * image_yscale)) + 5*image_yscale;
        draw_sprite_stretched_ext(icon, 0, xx,yy,hh*image_xscale,hh*image_yscale, c_white, image_alpha);
    } else {
        if(text != "") {
            draw_set_halign(fn_halign);
            draw_set_valign(fn_valign);
            if(backer == true){
                draw_sprite_ext(spr_text_backer, 0, x+text_xoff*image_xscale, y+text_yoff*image_yscale, image_xscale, image_yscale, 0, c_white, image_alpha);
            }
            var wid = max(1,image_xscale*sprite_get_width(sprite_index)-30);
            if(max_text > 0){ wid = max_text}
			draw_sprite_ext(spr_btn_bar_red, 0, x+text_xoff*image_xscale+20, y+text_yoff*image_yscale, image_xscale*icon_scale_multiplier, image_yscale*icon_scale_multiplier, 0, c_white, image_alpha);
            draw_text_outline_auto(x+text_xoff*image_xscale, y+text_yoff*image_yscale,text, b_c, f_c, image_xscale*1, image_xscale*1,
                image_alpha, wid*finish_scale,out_line_px,soft_outline);
        }
		
        if(!is_undefined(sprite_index) && sprite_exists(sprite_index)) {
			draw_self();
		}
    }
	*/
	if(sprite_exists(sprite_index)){
		draw_self();
	}
}
