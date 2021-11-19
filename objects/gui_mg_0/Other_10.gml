/// @description UI state engine
// 0. How To Play
// 1. Round Instruction
// 3. Game Play
// 4. Game Result


switch(ui_state){
	case 0: { // How To Play
		b_yes = createButtonTargeted(x, y + 310, elements_layer, gui_yes_text_top,id, 1, "Start");
        with(b_yes) {
			action_id = 0;
            do_pulse = 0;
            p_range = 0.35;
            do_sunray = 1;
            p_tween1 = TweenCreate(id, image_scale__, true, EaseInOutQuad, p_xscale_start, p_xscale_start+p_range,1);
            TweenPlayPatrol(p_tween1);
        }   
		break;
	}
	
	case 1 :{ // Round Instruction
		stop_timer();
		if (round_number > total_round){
			finish_gameplay();
		} else{
			instruction_text = get_instruction_text(round_number);
			var _game_type = get_game_type(round_number);
			if (current_game_type != _game_type){
				current_game_type = _game_type;
				game_type_data = undefined;
			} 
		
			var _txt = "PLAY";
		
			if (current_game_type == 1){
				_txt = "LISTEN";
				b_volume = createButtonTargeted(x, y - 115, elements_layer, btn_parent, noone, noone, "", noone, noone, spr_btn_volume);
			}
		
			b_swap = createButtonTargeted(x, y - 35, elements_layer, btn_PlayAudio, id, 1);
			b_swap.text = _txt;
		    b_swap.only_once = true;  
			b_swap.action_id = 1;
			b_swap.scale_text = 1.5;
	}
			
		
		
		break;
		
	}
	case 2 :{ // Game Play
		break;
	}
	case 3: { // Game Result
		break;
	}

}