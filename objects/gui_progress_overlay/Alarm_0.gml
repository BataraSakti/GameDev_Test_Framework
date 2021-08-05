alarm[2] = room_speed * 2;
switch(dvalue) {
    case 5: {
        text_sprite = spr_txt_testCompleted;
        break;
    }
    case 4: {
        text_sprite = spr_txt_perfect;
        break;
    }
    case 3: {
        text_sprite = spr_txt_great;
        break;
    }
    case 2: {
        text_sprite = spr_txt_good;
        break;
    }
    case 1: 
    default: {
        text_sprite = spr_txt_try_again;
        break;
    }
}
//bar_dest_1 = x-329;
//bar_dest_2 = x-165;
//bar_dest_3 = x-0;
//bar_dest_4 = x+165;
//bar_dest_5 = x+329;
show_debug("Progress Score = " + string(dvalue));
gui_mg_0._score = lvalue;
switch(lvalue) {
    case 0: {
        bar_width_start = 0;
        bar_width = bar_width_start;
        bar_width_end = bar_dest_1;
        if(lsub == 1) { 
            bar_width_end = 54;
        } else if(lsub == 2) {
            bar_width_end = 108;
        }
        break;
    }
    case 1: {
        bar_width_start = bar_dest_1;
        bar_width = bar_width_start;
        bar_width_end = bar_dest_2;
        break;
    }
    case 2: {
        bar_width_start = bar_dest_2;
        bar_width = bar_width_start;
        bar_width_end = bar_dest_3;
		bar_f_start = 1;
		bar_f_xscale = 1.2;
        if(lsub == 1) { 
            bar_width_end -= 108;
        } else if(lsub == 2) {
            bar_width_end -= 54;
        }
        //if(global.lang != "en"){
        //    scp_set_side_notification( "changelangtoeng"+string(dvalue), "available");
        //}
        //scp_do_action_helper(gui_context_box, 94, 0);
        break;
    }
    case 3: {
        bar_width_start = bar_dest_3;
        bar_width = bar_width_start;
        bar_width_end = bar_dest_4;
		bar_f_start = 1.2;
		bar_f_xscale = 1.75;
        //if(global.lang != "en"){
        //    scp_set_side_notification( "changelangtoeng"+string(dvalue), "available");
        //}
        //scp_do_action_helper(gui_context_box, 94, 0);
        break;
    }
    case 4: {
        bar_width_start = bar_dest_4;
        bar_width = bar_width_start;
        bar_width_end = bar_dest_5;
		bar_f_start = 1.75;
		bar_f_xscale = 2.35;
        //if(global.lang != "en"){
        //    scp_set_side_notification( "changelangtoeng"+string(dvalue), "available");
        //}
        //scp_do_action_helper(gui_context_box, 94, 0);
        break;
    }
	case 5: {
		bar_width_start = bar_dest_4;
        bar_width = bar_width_start;
        bar_width_end = bar_dest_6;
		bar_f_start = 2.35;
		bar_f_xscale = 3;
		break;
	}
}
with(_TTS){
	tts_update_rate = 0.8;
}

show_debug(string(lvalue) + " Level Progress Bar width = " + string(bar_width));

TweenFire(id, image_alpha__, true, EaseLinear, 0, 1, effect_time);
ScheduleScript(id, true, effect_time, 
	TweenFire, id, bar_width__, true, EaseLinear, bar_width_start, bar_width_end, level_bar_time);
	
if(bar_f_xscale > 1){
	ScheduleScript(id, true, effect_time, 
	TweenFire, id, image_scale_1__, true, EaseLinear, bar_f_start, bar_f_xscale, level_bar_time);
}
	




