/// @description Spawn controls 
if(no_fade == false && image_alpha_3 != 1) {
    TweenFire(id,image_alpha_3__,true,EaseLinear,0,1, text_fade_time);
}

switch(display_stage) {
    case 0: {
        //Intro / Tutorial
        b_yes = createButtonTargeted(x, y + 310, elements_layer, gui_yes_text_top,id, 15, "Start");
        with(b_yes) {
            do_pulse = 0;
            p_range = 0.35;
            do_sunray = 1;
            p_tween1 = TweenCreate(id, image_scale__, true, EaseInOutQuad, p_xscale_start, p_xscale_start+p_range,1);
            TweenPlayPatrol(p_tween1);
        }      
        break;
    }
    case 1: {
        //Game Type 1 - Select the Leter / Number / Word spoken.
       
        if(diff_level == 0) {
            round_text = string(test_cur_round-1)+"/"+string(test_total_round);
			var str_event = "MG0Stage"+string(test_cur_round)+"Play";
        } else {
            round_text = string(cur_round)+"/"+string(total_round);
			var str_event = "MG0Stage"+string(cur_round)+"Play";
        }
        
        cur_time = start_time;
        if(diff_level == 0) {
            time_text = string(test_timer_time)+"s";
        } else {
            time_text = string(cur_time)+"s";        
        }
		
        b_swap = createButtonTargeted(x, y - 35, elements_layer, btn_PlayAudio, id, 4);
		b_swap.text = "LISTEN";
        b_swap.only_once = true;  
		
		b_volume = createButtonTargeted(x, y - 115, elements_layer, btn_parent, id, "", "", "", "", spr_btn_volume);
		
  
        tock = false;
        test_timer_tock = false;

		if(trial == false){
			event_user(15);
		}
        break;
    }
    case 2: {
        //Game Type 2 - Select the words in the category.

        if(diff_level == 0) {
            round_text = string(test_cur_round-1)+"/"+string(test_total_round);
        } else {
            round_text = string(cur_round)+"/"+string(total_round);
        }
        cur_time = start_time;
        if(diff_level == 0) {
            time_text = string(test_timer_time)+"s";
        } else {
            time_text = string(cur_time)+"s";        
        }
        b_swap = createButtonTargeted(x, y - 35, elements_layer, btn_PlayAudio, id, 4);
		b_swap.text = "PLAY";
        b_swap.only_once = true;
		
        tock = false;
        test_timer_tock = false;

		if(trial == false){
			event_user(15);
		}
        break;
    }
    case 3: {
        //Game Type 3 - Select the correct word to complete the sentance.
      

        if(diff_level == 0) {
            round_text = string(test_cur_round-1)+"/"+string(test_total_round);
        } else {
            round_text = string(cur_round)+"/"+string(total_round);
        }
        cur_time = start_time;
        if(diff_level == 0) {
            time_text = string(test_timer_time)+"s";
        } else {
            time_text = string(cur_time)+"s";        
        }
		
        b_swap = createButtonTargeted(x, y - 35, elements_layer, btn_PlayAudio, id, 4);
		b_swap.text = "PLAY";
        b_swap.only_once = true;
		
        tock = false;
        test_timer_tock = false;

		if(trial == false){
			event_user(15);
		}
        break;
    }
	case 4: {
        //Game Type 4 - For now its the same as Game 3 (27 April 2020)

        if(diff_level == 0) {
            round_text = string(test_cur_round-1)+"/"+string(test_total_round);
        } else {
            round_text = string(cur_round)+"/"+string(total_round);
        }
        cur_time = start_time;
        if(diff_level == 0) {
            time_text = string(test_timer_time)+"s";
        } else {
            time_text = string(cur_time)+"s";        
        }
		
        b_swap = createButtonTargeted(x, y - 35, elements_layer, btn_PlayAudio, id, 4);
		b_swap.text = "PLAY";
        b_swap.only_once = true;
		
        tock = false;
        test_timer_tock = false;

		if(trial == false){
			event_user(15);
		}
        break;
    }
    case 5: {
        //Game Type 5 - Build a sentance from the provided words
        
        if(diff_level == 0) {
            round_text = string(test_cur_round-1)+"/"+string(test_total_round);
        } else {
            round_text = string(cur_round)+"/"+string(total_round);
        }
        cur_time = start_time;
        if(diff_level == 0) {
            time_text = string(test_timer_time)+"s";
        } else {
            time_text = string(cur_time)+"s";        
        }
        
		b_swap = createButtonTargeted(x, y - 35, elements_layer, btn_PlayAudio, id, 4);
		b_swap.text = "PLAY";
        b_swap.only_once = true;
		
        tock = false;
        test_timer_tock = false;
		
		if(trial == false){
			event_user(15);
		}
        break;
    }
	case 6: {
        //Game 6 - Match each paragraph to the correct heading in the multiple-choice format.
      
		if(diff_level == 0) {
			round_text = string(test_cur_round-1)+"/"+string(test_total_round);
        } else {
            round_text = string(cur_round)+"/"+string(total_round);
        }
        cur_time = start_time;
        if(diff_level == 0) {
            time_text = string(test_timer_time)+"s";
        } else {
            time_text = string(cur_time)+"s";        
        }
        
		b_swap = createButtonTargeted(x, y - 35, elements_layer, btn_PlayAudio, id, 4);
		b_swap.text = "PLAY";
        b_swap.only_once = true;
		
        tock = false;
        test_timer_tock = false;
        
		if(trial == false){
			event_user(15);
		}
        break;
    }
    case 7: {
        //Level Up (Next Game type)
        
        ScheduleEventUser(id, false, 1, 3); //Call update to the main switch next step.
        
        break;
    }
    case 8: {
        //Game Over
        
        with(btn_gui_confirm_no) { skip_confirm = true; }
        
        if(last_stage == 6 && instance_number(gui_progress_overlay) == 0) {
            b_yes = createButtonTargeted(x, y + 160, elements_layer, gui_yes_text_top,id, 0, "");
            b_gui = instance_create_layer(x,y,elements_layer, gui_progress_overlay);
            b_gui.dvalue = 5;
            b_gui.lvalue = 5;
        } else {
}
        break;
    }
}

with(btn_PlayAudio){
	dont_wiggle = true;
	text_yoff = 0;
	text_xoff = 80;
	out_line_px = 0;
	scale_text = 1;
	
}

no_fade = false;
