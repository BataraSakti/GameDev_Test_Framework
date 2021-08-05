if(!can_click){ p_sched = ScheduleEventUser(id, true, p_time, p_event); exit; }

if(!TweenIsPlaying(p_tween)) {
    var i = 0;
    repeat(2){
        if(i > 0){
            TweenPlayBounceDelay(p_tween,s_animate_spd+0.2,EaseInOutExpo,p_x_start,p_x_left,s_animate_spd);
            TweenPlayBounceDelay(p_tween,s_animate_spd*2+0.3,EaseInOutExpo,x,p_x_right,s_animate_spd);
        } else {
            TweenPlayBounce(p_tween,EaseInOutExpo,p_x_start,p_x_left,s_animate_spd);
            TweenPlayBounceDelay(p_tween,s_animate_spd+0.1,EaseInOutExpo,x,p_x_right,s_animate_spd);
        }
        i++;
    }
}


if(do_pulse == 1) {
    if(do_loop == 1){
        p_sched = ScheduleEventUser(id, true, p_time, p_event);
    }
}

