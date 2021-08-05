/// @description routine
if(tock == true) {
    tick += delta_time;
    
    if(tick >= 1000000) {
        cur_time -= 1;
        if(diff_level != 0) {
            time_text = string(cur_time)+"s";
               
            if(cur_time <= 0) {
             
                inputs = inputs_needed-1; //Cur timeout on multiinput needs this.
                event_user(5); //Final Input
                tock = false;
            }
        }
        
        tick -= 1000000;
    }
   
}   

if(test_timer_tock == true) {
    test_timer_tick += delta_time;
    
    if(test_timer_tick >= 1000000) {
        test_timer_time -= 1;
        time_text = string(test_timer_time)+"s";
        
        if(test_timer_time <= 0) {
            show_debug("test_timer_time Timeout - End Round");
            inputs = inputs_needed-1; //Cur timeout on multiinput needs this.
            player_retrys = 99; //FAIL NOW ALWAYS
            event_user(5); //Final Input
            tock = false;
            test_timer_tock = false;
        }
        
        test_timer_tick -= 1000000;
    }
    //show_debug("test_timer_tick --- " + string(test_timer_tick));
}  
//image_speed = room_speed * 0.2;
image_speed = 5.2;

///Click to proceed

if(mouse_check_button_released(mb_left)) {
	if(display_stage>0){
		
		if(closed == false && display_stage == 0 && !already_progressed){       
		    ScheduleEventUser(id,true,text_fade_time,3);
			
		    already_progressed = true;
		    perform_event(btn_gui_no, 0);
		}
		
	    if(display_stage > 0 && !instance_exists(btn_PlayAudio) && !instance_exists(gui_progress_overlay)){
	        draw_hand = 0; 
	        //alarm[1] = room_speed*2;
	    }
	}else{
		if(b_yes!=noone){
			
			if(closed == false && display_stage == 0 && !already_progressed){       
			    ScheduleEventUser(id, true,text_fade_time,3);
			    already_progressed = true;
			    perform_event(btn_gui_no, 0);
			}
			
		    if(display_stage > 0 && !instance_exists(btn_PlayAudio) && !instance_exists(gui_progress_overlay)){
		        draw_hand = 0; 
		        //alarm[1] = room_speed*2;
		    }
	
		}
		
	}
}
///Counter color
if(display_stage == 2){
    switch(c_counter){
        default: //fall through
        case 0: {
            c_c = c_maroon;
            break;
        }
        case 1: {
            c_c = c_red;
            break;
        }
        case 2: {
            c_c = c_orange;
            break;
        }
        case 3: {
            c_c = c_green;
            break;
        }
    }
}