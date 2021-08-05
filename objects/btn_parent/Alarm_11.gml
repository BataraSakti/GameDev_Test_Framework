

if(y < 0) {
    // Have object fall from top to postion in 2 seconds
    TweenPlayOnce(tween_y, DampEaseOutBounce, y, -y, spawn_effect_time_fall);
} else {
    TweenFire(id, image_alpha__, true, EaseInQuad, 0, 1, spawn_effect_time_alpha);
    switch(cr_mode){
        default:
        case 0: { //Normal fade
            TweenFire(id, image_xscale__, true, EaseInQuad, 0, p_xscale_start, spawn_effect_time_scale);
            TweenFire(id, image_yscale__, true, EaseInQuad, 0, p_yscale_start, spawn_effect_time_scale);
            break;
        }
        case 1: { //Bounce spawn
            TweenFire(id, image_xscale__, true, EaseInBack, 1.5, p_xscale_start, spawn_effect_time_bounce);
            TweenFire(id, image_yscale__, true, EaseInBack, 1.5, p_yscale_start, spawn_effect_time_bounce);
            break;
        }
        case 2: { //Slide left
            image_xscale = p_xscale_start;
            image_yscale = p_yscale_start;
            TweenFire(id, x__, true, EaseInQuad, p_x_right, p_x_start, spawn_effect_time_slide);
            break;
        }
        case 3: { //Slide right
            image_xscale = p_xscale_start;
            image_yscale = p_yscale_start;
            TweenFire(id, x__, true, EaseInQuad, p_x_left, p_x_start, spawn_effect_time_slide);
            break;
        }
        case 4: {//Slide up
            image_xscale = p_xscale_start;
            image_yscale = p_yscale_start;
            TweenFire(id, y__, true, EaseInQuad, p_y_end+25, p_y_end-5, spawn_effect_time_slide);
            break;
        }
    }
}

switch(tween_mode){
    case 0:{
        //p_tween = TweenCreate(id, image_scale__, true, EaseLinear, p_xscale_start, p_xscale_start+p_range,p_ptime);
        p_tween_x_scale = TweenCreate(id, image_xscale__, true, EaseLinear, p_xscale_start, p_xscale_start+p_range,p_ptime);
        p_tween_y_scale = TweenCreate(id, image_yscale__, true, EaseLinear, p_yscale_start, p_yscale_start+p_range,p_ptime);
        p_event = 3;
        break;
    }
    case 1:{
        p_tween = TweenCreate(id, image_angle__, true);
        p_event = 4;
        break;
    }
    case 2:{
        p_tween = TweenCreate(id, y__,true);
        p_event = 5;
        break;
    }
    case 3:{
        p_tween = TweenCreate(id, x__,true);
        p_event = 6;
        break;
    }
    case 4: {
        p_tween = TweenCreate(id, y__,true);
        p_event = 7;
        break;
    }
}

if(do_loop != 2){
    if(p_sched == ScheduleNull() && do_pulse == 1) {
        p_sched = ScheduleEventUser(id, true, p_time, p_event);
    }
}

