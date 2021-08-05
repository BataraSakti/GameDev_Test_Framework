/// @description Remove controls
if(no_fade == false) {
    TweenFire(id,image_alpha_3__,true,EaseLinear,1,0, text_fade_time);
}
    
switch(display_stage) {
    case 0: {
        //Intro / Tutorial
        show_debug("Clear UI 0");
        perform_event(b_yes, 0);
        b_yes = noone;
		
        
        perform_event(btn_gui_confirm_no, 0);
        b_marshman = noone;
        break;
    }
    case 1: {
        //Game Type 1 - Select the Leter / Number / Word spoken.
        show_debug("Clear UI 1");
        perform_event(b_swap, 0);
        b_swap = noone;
		perform_event(b_volume, 0);
        b_volume = noone;
        
        perform_event(o_marshman, 0);
        
        break;
    }
    case 2: {
        show_debug("Clear UI 2");
        //Game Type 2 - Select the words in the category.
        perform_event(b_swap, 0);
        b_swap = noone;
		perform_event(b_volume, 0);
        b_volume = noone;
        
        perform_event(o_marshman, 0);
        
        break;
    }
    case 3: {
        show_debug("Clear UI 3");
        //Game Type 3 - Select the correct word to complete the sentance.
        perform_event(b_swap, 0);
        b_swap = noone;
		perform_event(b_volume, 0);
        b_volume = noone;
        
        perform_event(o_marshman, 0);
        
        break;
    }
	case 4: {
        show_debug("Clear UI 4");
        //Game Type 4 - For now its the same as Game 3 (27 April 2020)
        perform_event(b_swap, 0);
        b_swap = noone;
		perform_event(b_volume, 0);
        b_volume = noone;
        
        perform_event(o_marshman, 0);
        
        break;
    }
    case 5: {
        show_debug("Clear UI 5");
        //Game Type 5 - Build a sentance from the provided words.
        perform_event(b_swap, 0);
        b_swap = noone;
		perform_event(b_volume, 0);
        b_volume = noone;
        
        perform_event(o_marshman, 0);
        
        break;
    }
	case 6: {
        //Game 6 - Match each paragraph to the correct heading in the multiple-choice format.
		draw_question_game6 = false;
        show_debug("Clear UI 6");
        perform_event(b_swap, 0);
        b_swap = noone;
		perform_event(b_volume, 0);
        b_volume = noone;
        
        perform_event(o_marshman, 0);
        
        break;
    }
    case 7: {
        //Level Up (Next Game type)
        show_debug("Clear UI 7");
        perform_event(b_yes, 0);
        b_yes = noone;
        perform_event(b_gui, 0);
        b_gui = noone;
        
        break;
    }
    case 8: {
        //Game Over
        show_debug("Clear UI ");
        
        b_marshman = noone;
        break;
    }
}
