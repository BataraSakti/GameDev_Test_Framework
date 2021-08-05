if(view_current == 1) {    
    if(do_sunray == 1){
            draw_sprite_ext(spr_sunray_radial, 0, x, y, p_xscale_start, p_yscale_start, global.rot, c_white, image_alpha);
    }

    draw_self();
    if(icon != noone && sprite_exists(icon)) {
       
        
        var hh = sprite_get_height(sprite_index) - 16*image_xscale;
        if(text != "") {
            draw_set_halign(fn_halign);
            draw_set_valign(fn_valign);
            var xff = (hh*0.5*image_xscale) + 6*image_xscale;
            draw_text_outline_auto(x+xff,y,text, b_c, f_c, image_xscale*1, image_xscale*1,
                image_alpha,max(1,image_xscale*sprite_get_width(sprite_index)-(30+hh+12*image_xscale)),out_line_px,soft_outline);
        } 
        var xx = (x - (sprite_get_width(sprite_index) * 0.5 * image_xscale)) + 6*image_xscale;
        var yy = (y - (sprite_get_height(sprite_index) * 0.5 * image_yscale)) + 5*image_yscale;
        draw_sprite_stretched_ext(icon, 0, xx,yy,hh*image_xscale,hh*image_yscale, c_white, image_alpha);
    } else {
        if(text != "") {
            draw_set_halign(fn_halign);
            draw_set_valign(fn_valign);
            draw_sprite_ext(spr_gui_unlocked_shader, 0, x+text_xoff, y+text_yoff, image_xscale, image_yscale, 0, c_white, image_alpha);
            draw_text_outline_auto(x+text_xoff,y+text_yoff,text, b_c, f_c, image_xscale*1, image_xscale*1,
                image_alpha,max(1,image_xscale*sprite_get_width(sprite_index)-30),out_line_px,soft_outline);
        }
        
        
    }
    
}

