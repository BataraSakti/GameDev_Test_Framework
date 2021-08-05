if(!can_click){ p_sched = ScheduleEventUser(id, true, p_time, p_event); exit; }

if(!TweenIsPlaying(p_tween)) {
    TweenPlayBounce(p_tween, EaseInOutSine, rot_left, rot_right,w_animate_spd);    
    if(do_loop == 0){
        TweenPlayOnce(p_tween, w_animate_spd+0.1,EaseInOutSine, image_angle, w_angle_start,w_animate_spd);
    }
}


if(do_pulse == 1) {
    if(do_loop == 1){
        p_sched = ScheduleEventUser(id, true, w_time, p_event);
    }
}

