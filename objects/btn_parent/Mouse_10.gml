if(is_imploding == true) { exit; }
if(can_click == 0) { exit; }
if(flat){ exit; }
if (p_tween_x_scale != TweenNull()){
	if(!TweenExists(p_tween_x_scale) || !TweenIsPlaying(p_tween_x_scale)) {
	    TweenFireBounce(id, image_xscale__, true, EaseInOutQuad, p_xscale_start, p_xscale_start+mouse_enter_x_scale, 0.15);
	    TweenFireBounce(id, image_yscale__, true, EaseInOutQuad, p_yscale_start, p_yscale_start+mouse_enter_x_scale, 0.15);
	}
}

