/// @description buttons callback
switch(action_id){
	case 0:{ //speak
		if (array_length(marshmen_answers) > 0){
			instance_create_layer(x,y,marsh_lay_bot,obj_first_hint);
			target_text_to_speak = string(marshmen_answers[0]);
	        forceVoice(target_text_to_speak, "en");
			if(max_hint >= 2){
				instance_destroy_safe(b_hint);
			}
			max_hint++;
		}
		break;
	}
	
	case 1:{ //spawn the first hint
		instance_create_layer(x,y,elements_layer,obj_first_hint);
		break;
	}
	
}

