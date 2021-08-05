if(!can_click){ p_sched = ScheduleEventUser(id, true, p_time, p_event); exit; }

if(!TweenIsPlaying(p_tween)) {
    if(y != p_y_start){TweenFire(id, y__, true, EaseInSine, y, p_y_start, b_animate_up_spd);}
    ScheduleScript(id,true, b_animate_up_spd+0.1,TweenPlayOnce, p_tween,EaseOutBounce, p_y_start, p_y_end, b_animate_drop_spd);
}


if(do_pulse == 1) {
    if(do_loop == 1){
        p_sched = ScheduleEventUser(id, true, p_time, p_event);
    }
}

