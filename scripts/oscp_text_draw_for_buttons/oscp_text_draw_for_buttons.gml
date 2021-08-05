/// @description oscp_text_draw_for_buttons()
/// @function oscp_text_draw_for_buttons
function oscp_text_draw_for_buttons() {
	//gml_pragma("forceinline"); // in YYC, proccessing boost
	//Script only good for children of button parent to draw text

	max_width_multiply = 1;

	if(text != "" && draw_texts) {
	    var nx_tx_sz = image_xscale*max_text_scale;
	    draw_set_halign(fn_halign);
	    draw_set_valign(fn_valign);
		scp_set_font(m_draw_font);
		if(use_fnt_normal){
			draw_set_font(fnt_normal);
		}
	    draw_text_outline_auto(x+(image_xscale*text_xoff),y+(image_yscale*text_yoff), text, b_c, f_c,
	        nx_tx_sz*scale_text, nx_tx_sz*scale_text, image_alpha, min(force_max, max(1,nx_tx_sz*sprite_get_width(sprite_index)-oscp_range_nerf))*max_width_multiply,
	        out_line_px, soft_outline, scale_text);
		if(use_fnt_normal){
			draw_set_font(global.font);
		}
		
	}



}
