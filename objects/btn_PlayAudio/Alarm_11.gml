if(y < 0) {
    // Have object fall from top to postion in 2 seconds
    TweenPlayOnce(tween_y, DampEaseOutBounce, y, -y, 2);
} else {
    TweenFire(id, image_alpha__, true, EaseInQuad, 0, 1, 0.35);
    TweenFire(id, image_xscale__, true, EaseInQuad, 0, p_xscale_start, 0.35);
    TweenFire(id, image_yscale__, true, EaseInQuad, 0, p_yscale_start, 0.35);
}

p_tween = TweenCreate(id, image_angle__, true);
p_tween_x_scale = TweenNull();
p_tween_y_scale = TweenNull();

if(p_sched == ScheduleNull() && do_pulse == 1) {
    p_sched = ScheduleEventUser(id, true, p_time, p_event);
}


