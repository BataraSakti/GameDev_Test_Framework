/// @description Draw
// Draw icon in the middle of the button
if(view_current == 1) {
	
	if(follow_parent && _parent != noone && instance_exists(_parent)){
	    //take care of your posiiton
	    x = _parent.x + x_offset;
	    y = _parent.y + y_offset;
	}
	
    //Allows for buttons to have a base size bigger than the sprite itself... 
    var t_xscale = (image_xscale*base_xscale);
    var t_yscale = (image_yscale*base_yscale);
    
    if(do_sunray == 1){
        draw_sprite_ext(spr_sunray_radial, 0, x, y, p_xscale_start*p_xscale_spin_base,
             p_yscale_start*p_xscale_spin_base, global.rot, c_white, image_alpha);
    }
    
    draw_sprite_ext(sprite_index, image_index, x, y, t_xscale, t_yscale , image_angle, image_blend, image_alpha);
    //draw_self();
    
    if(icon != noone && sprite_exists(icon)) {
        var hh = sprite_get_height(sprite_index) - icon_adjust*t_xscale;
        if(text != "") {
            draw_set_halign(fn_halign);
            draw_set_valign(fn_valign);
            if(iconRight == 0 && iconLeft == 1){
                var xff = (hh*0.5*t_xscale) + 6*t_xscale - 60;
            } else {
                var xff = (hh*0.5*t_xscale) + 6*t_xscale;
            }
            var nx_tx_sz = t_xscale*max_text_scale;
            draw_text_outline_auto(x+xff+text_xoff,y-4+text_yoff,text, b_c, f_c, nx_tx_sz, nx_tx_sz, 
                image_alpha,max(1,t_xscale*sprite_get_width(sprite_index)-(30+hh+12*t_xscale)),
                    out_line_px,soft_outline);
        } 
        
        if(iconRight == 0 && iconLeft == 1){
            var xx = (x + (sprite_get_width(sprite_index) * 0.5 * t_xscale)) + 6*t_xscale - 65;
        } else {
            var xx = (x - (sprite_get_width(sprite_index) * 0.5 * t_xscale)) + 6*t_xscale;
        }
        draw_sprite_ext(icon, icon_subimg, x+ic_xadj, y+ic_yadj, t_xscale*icon_scale, t_yscale*icon_scale, icon_rot, col, image_alpha);
        //var xx = (x - (sprite_get_width(sprite_index) * 0.5 * t_xscale)) + 0*t_xscale - (sprite_get_width(sprite_index)*0.5);
        //var yy = (y - (sprite_get_height(sprite_index) * 0.5 * t_yscale)) + 5*t_yscale - (sprite_get_height(sprite_index)*0.5);
        //draw_sprite_stretched_ext(icon, icon_subimg, xx,yy,hh*t_xscale*icon_scale,hh*t_yscale*icon_scale, c_white, image_alpha);
    } else {
        oscp_text_draw_for_buttons();
    }

}

