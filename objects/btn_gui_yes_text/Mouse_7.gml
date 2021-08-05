/// @description Insert description here
if(visible) {
	
    if(is_imploding == true) { exit; }
	if(_target != noone && !is_undefined(_target) && instance_exists(_target)){
		if(instance_exists(gui_card_reward)){
			if(is_undefined(_target.object_index)){
				if(object_get_name(_target.object_index) != "gui_card_reward"){
					exit;
				}
			}
			
		}
	}
   
    if(can_click == 1 && !ScheduleExists(a_sch) && was_pressed) {
        can_click = 0;
        show_debug("left released " + object_get_name(id.object_index) + " with id " +  string(id));
        sprite_index = button_sprite_;
        //alarm[1] = 3;    
        b_sch = ScheduleAlarm(id,1,p_lock_delay,1);
        a_sch = ScheduleAlarm(id,1,p_effect_time*0.5,0);
        
        
        
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

with(btn_parent){
	was_pressed = false;
}
