/// @description Wiggle Effect
if(dont_wiggle){ exit; }
if(!can_click){ p_sched = ScheduleEventUser(id, true, p_time, p_event); exit; }

if(!TweenIsPlaying(p_tween)) {
         
        TweenPlayPatrol(p_tween, EaseInOutSine, rot_left, rot_right,p_ptime);
       
        do_sunray = 1;
}
