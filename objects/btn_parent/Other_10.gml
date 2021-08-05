/// @description Destroy Self
if(is_imploding == false) {
    is_imploding = true;
    
    if(TweenExists(p_tween_x_scale) && TweenIsPlaying(p_tween_x_scale)) {
        TweenStop(p_tween_x_scale);
    }

    if(TweenExists(p_tween_y_scale) &&TweenIsPlaying(p_tween_y_scale)) {
        TweenStop(p_tween_y_scale);
    }    
    
    TweenFire(id, image_xscale__, true, EaseLinear, image_xscale, 0, ui_time);
    TweenFire(id, image_yscale__, true, EaseLinear, image_yscale, 0, ui_time);
    TweenFire(id, image_alpha__, true, EaseLinear, image_alpha, 0, ui_time);
    
    ScheduleScript(id, true, ui_time+0.05, destroy_instance, id);
}

