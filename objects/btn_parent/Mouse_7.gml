//show_debug(object_get_name(object_index) + " left pressed");

if(visible) {
	
    if(is_imploding == true) { exit; }

	//Todo: Blocking buttons for card reward exclusivity should be done better. 
	if(_target != noone && !is_undefined(_target) && instance_exists(_target)){
		
	}
	

	
	
    if(can_click == 1 && !ScheduleExists(a_sch) && was_pressed) {
        can_click = 0;
        show_debug("left released " + object_get_name(object_index) + " with id " +  string(id));
        sprite_index = sprite;
        //alarm[1] = 3;    
        b_sch = ScheduleAlarm(id,1,p_lock_delay,1);
        a_sch = ScheduleAlarm(id,1,p_effect_time*0.5,0);
        
		//sound stuff
		var _text = text;
		var _number_of_spaces = string_count(" ",text);
		if(_number_of_spaces > 0){
			_text = string_lower(_text);
		}
		if(doSpeak == true && (forceSpeak == true || global.button_speak == true)) {
		    if(!force_eng_tts){
		        if(forceSpeak){
		            forceVoice(_text);
		        } else {
		            fxVoice(_text);
		        }
		    } else {
		        forceVoice(_text, global.lang_en_country);
		    }
		}
        
		if(TweenExists(p_tween_x_scale) && TweenExists(p_tween_y_scale)) { //Prevent Crash from Firebase
	        if(!TweenIsPlaying(p_tween_x_scale) && !TweenIsPlaying(p_tween_y_scale)) {
	            if(p_alpha_start != p_alpha_dest) {
	                TweenFireBounce(id, image_alpha__, true, p_effect_tween_type_alpha, p_alpha_start, p_alpha_dest, p_effect_time);
	            }
	            if(p_xscale_start != p_xscale_dest) {
	                TweenFireBounce(id, image_xscale__, true, p_effect_tween_type_scale, p_xscale_start, p_xscale_dest, p_effect_time);
	            }
	            if(p_yscale_start != p_yscale_dest) {
	                TweenFireBounce(id, image_yscale__, true, p_effect_tween_type_scale, p_yscale_start, p_yscale_dest, p_effect_time);
	            }
	        }
		}
    }
}

press_pressed_time = current_time - press_start_time;

with(btn_parent){
	was_pressed = false;
}
