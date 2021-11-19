if(is_imploding == true) { exit; }


if(can_return == true) {
    show_debug("Trying to return wordmellow --- " + string(text));
	
	var _text = text;
	if (_text != ""){
		with(gui_mg_0){
			var _put_back = false;
			for (var i = 0; i <  array_length(shadow_marshmans); i++){
				if (shadow_marshmans[i].text == ""){continue;}
				if (shadow_marshmans[i].text == other.text){
					_put_back = true;
				}
				
				if (_put_back){
					for (var j = 0; j < array_length(marsmans); j++){
						var _s_text = shadow_marshmans[i].text;
						if (string(marsmans[j].dvalue == _s_text)){
							with (marsmans[j]){
								text = _s_text;
			                    display_only = false;
			                    sprite_index = spr_marshman;
			                    image_xscale = 1;
			                    image_yscale = 1;
			                    did_once = false;
			                    display_index = -1;
			                    do_ring = false;
			                    f_c = c_maroon;
							}
							break;
						}
					}
					with (shadow_marshmans[i]){
						text = "";
	                    image_xscale = 0.50;
	                    image_yscale = 0.50;
	                    p_xscale_start = 0.50;
	                    p_yscale_start = 0.50;
	                    sprite_index = spr_marshman_outline;
	                    
					}
				}
			}
			
			//Adjust player answer
			player_answer = "";
			for (var i = 0; i < array_length(shadow_marshmans); i++){
				if (shadow_marshmans[i].text != ""){
					if (player_answer == ""){
						player_answer = shadow_marshmans[i].text;
					} else {
						player_answer += " " + shadow_marshmans[i].text;
					}
				}
			}
			
		}
	}
	
	
} else {
    if(only_once == true) {
        if(did_once == false) {
            did_once = true;
        } else {
            exit;
        }
    }
    
    if(show_ring_on_press == true) {
        do_ring = true;
        f_c = answer_color;
		if(answer_color == good_c){
			//marshman fade out
			
			TweenFire(id, image_alpha_0__, true, EaseOutQuad, image_alpha_0, 0, 1);
		}
    }
    
    //if(doSpeak == true && global.button_speak == true || forceSpeak == true && doSpeak == true) {
    //    forceVoice(text, global.lang_en_country);
    //} else {
    //    fxPlay(sfx_hit_1, 0, 0); //Error Chime
    //}
    
    if(_parent != noone) {
        with(_parent) {
            event_user(other._parent_event);
        }
    }
    
    if(_target != noone) {
        with(_target) {
            ret_man = other.id;
			ret_value = other.dvalue;
            marsman_answer = other.dvalue;
			action_id = other.action_id;
            event_user(other._target_event);
        }
    }
}

