/// @description buttons callbacks


switch (action_id){
	case 0:{ //enter the game
		goto_ui_state(1);
		break;
	}
	case 1:{ //btn listen
		
		goto_ui_state(2);
		if (!isSampleRound()){
			start_timer();
		}
		break;
	}
	case 2: { // hint speak
		instance_create_layer(x,y,marsh_lay_bot,obj_first_hint);
		
        forceVoice(danswer, "en");
		if(max_hint >= 2){
			instance_destroy_safe(b_hint);
		}
		max_hint++;
		break;
	}
	case 3:{ //marshman callbacks
		if (current_game_type != 2 && current_game_type != 5){
			marshman_single_answer_responder();
		} else {
			marshman_multiple_answer_responder();
		}
		break;
	}
	case 4:{ //close the game
		destroy_current_ui_objects();
		ScheduleScript(id, true, 0.35, destroy_instance, id);
		break;
	}
}
