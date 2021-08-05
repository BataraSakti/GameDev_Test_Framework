/// @description scp_combine_spr_txt(sprite, subimg, back_color, front_color, text, txt_halign, txt_valign,clr_alpha, auto_set_sprite,);
/// @function scp_combine_spr_txt
/// @param sprite
/// @param  subimg
/// @param  back_color
/// @param  front_color
/// @param  text
/// @param  txt_halign
/// @param  txt_valign
/// @param clr_alpha
/// @param  auto_set_sprite
function scp_combine_spr_txt(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {
	/* NOTE: Only used on buttons using btn_parent as a parent since it is dependent on variable
	declared on the btn_parent, 
	- Also dependent on script draw_text_drop_auto. To change alpha, scale & text offset:
	  change from btn's var before running the script
	- Guide : x scale   - p_xscale_start
	          y scale   - p_yscale_start
	          alpha     - p_alpha_start
	          x off set - text_xoff
	          y off set - text_yoff

	arg 0 = sprite name/index
	arg 1 = image index
	arg 2 = back text color
	arg 3 = front text color
	arg 4 = string
	arg 5 = horizontal text align
	arg 6 = vertical text align
	arg 7 = clear alpha color - avoid using same color on text since it will make the text to be transparent
	arg 8 = choose whether to manually set the sprite to occupy which object or set it to the current object executing the code
	*/
	var surface = noone;
	var h = sprite_get_height(argument0);
	var w = sprite_get_width(argument0);
	var ad_x = 0;
	var ad_y = 0;
	if(h/2+(p_yscale_start*text_yoff) > h){
	    ad_y = text_yoff;
	}else if(w/2+(p_xscale_start*text_xoff) > w){
	    ad_x = text_xoff;
	}

	var t_m_draw_font = global.font;
	if(variable_instance_exists(id, "m_draw_font")) {
		t_m_draw_font = m_draw_font;
	}

	surface = surface_create(w+ad_x, h+ad_y);
	surface_set_target(surface);
	draw_clear_alpha(argument7, 0);
	draw_sprite(argument0, argument1, w/2, h/2);
	if(icon != noone && sprite_exists(icon)) {
	    var hh = h - icon_adjust*p_xscale_start;
	    var h1 = sprite_get_width(icon);
	    var w1 = sprite_get_height(icon);
	    if(argument4 != "") {
	        draw_set_halign(argument5);
	        draw_set_valign(argument6);
			scp_set_font(t_m_draw_font);
	        if(iconRight == 0 && iconLeft == 1){
	            var xff = -(w1/2);//(hh*0.5*p_xscale_start) + 6*p_xscale_start - 60;
	        } else {          
	            var xff = w1/2;//(hh*0.5*p_xscale_start) + 6*p_xscale_start;
	        }
        
	        draw_text_outline_auto(w/2+(p_xscale_start*text_xoff)+xff,h/2+(p_yscale_start*text_yoff),argument4, argument2, argument3, p_xscale_start*1, p_xscale_start*1, p_alpha_start,min(force_max,max( 1, w*0.65)),out_line_px, soft_outline);
	    } 
	     if(iconRight == 0 && iconLeft == 1){
	            var xx = w*0.85-(w1/2);//(w/2 + (w * 0.5 * p_xscale_start)) + 6*p_xscale_start - 65;
	        } else {
	            var xx = w*0.25-(w1/2);//(w/2 - (w * 0.5 * p_xscale_start)) + 6*p_xscale_start;
	        }


	    var yy = h/2-(h1/2);//(h/2 - (h * 0.5 * p_yscale_start)) + 5*p_yscale_start;
	    draw_sprite_stretched_ext(icon, 0, xx+(p_yscale_start*icon_xoff),yy+(p_yscale_start*icon_yoff),hh*p_xscale_start,hh*p_yscale_start, c_white, p_alpha_start);
	} else {
	    if(argument4 != "") {    
	        draw_set_halign(argument5);
	        draw_set_valign(argument6);
			scp_set_font(t_m_draw_font);
	        var nx_tx_sz = p_xscale_start*max_text_scale;
        
	        draw_text_outline_auto(w/2+(p_xscale_start*text_xoff),h/2+(p_yscale_start*text_yoff),argument4, argument2, argument3,
	            nx_tx_sz, nx_tx_sz, p_alpha_start, min(force_max, max(1,p_xscale_start*sprite_get_width(argument0)-30)),
	            out_line_px, soft_outline);
	    }
	}    
	var new_spr = sprite_create_from_surface(surface, 0, 0, w+ad_x, h+ad_y, false, true, w/2, h/2);
	surface_reset_target();
	scp_free_surface(surface);
	if(argument8){
	    sprite = new_spr;
	    press = new_spr;
	    sprite_index = new_spr;
	} 
	return new_spr;





}
