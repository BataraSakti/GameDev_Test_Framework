/// @description Pulse effect
if(do_pulse == 0) { exit; }

if(!can_click && do_pulse == 1){ p_sched = ScheduleEventUser(id, true, p_time, p_event); exit; }

if(TweenExists(p_tween_x_scale) && !TweenIsPlaying(p_tween_x_scale)) {
    TweenPlayBounce(p_tween_x_scale);
}

if(TweenExists(p_tween_y_scale) && !TweenIsPlaying(p_tween_y_scale)){
    TweenPlayBounce(p_tween_y_scale);
}

if(do_pulse == 1) {
    p_sched = ScheduleEventUser(id, true, p_time, p_event);
}
