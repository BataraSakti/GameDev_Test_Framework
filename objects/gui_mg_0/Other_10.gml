///@description open-close

if(closed == true) {
    image_alpha_2 = 0;
    TweenFire(id,x__,true,EaseInOutCubic,x, open_x,open_time);
    ScheduleEventUser(id,true,open_time,1); //Spawn in Controls
    closed = false;
    TweenFire(id,image_alpha_2__,true,EaseLinear,0,1, text_fade_time);
} else {
	event_user(2);
    perform_event(btn_gui_confirm_no, 0);
    if(b_gui != noone) {
        perform_event(b_gui, 0);
        b_gui = noone;
    }
    if(b_yes != noone) {
        perform_event(b_yes, 0);
        b_yes = noone;
    }
    TweenFire(id, x__, true, EaseInOutCubic,x, closed_x, open_time);
    closed = true;
    TweenFire(id,image_alpha_2__,true,EaseLinear,1,0, text_fade_time);
   
    //Boom baby boom
    ScheduleScript(id, true, open_time + 0.2, destroy_instance, id);
    TweenFire(id,image_alpha_2__,true,EaseLinear,1,0, text_fade_time);

	
}

