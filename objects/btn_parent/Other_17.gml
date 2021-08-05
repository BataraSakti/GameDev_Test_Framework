if(!can_click){ p_sched = ScheduleEventUser(id, true, p_time, p_event); exit; }

if(!TweenIsPlaying(p_tween)) {
    TweenPlayBounce(p_tween, EaseInOutCubic, p_y_end-5, p_y_end-5+range_up, speed_up);
}


if(do_pulse == 1) {
    if(do_loop == 1){
        p_sched = ScheduleEventUser(id, true, p_time, p_event);
    }
}

