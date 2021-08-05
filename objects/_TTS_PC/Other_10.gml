/// @description Speak Async
//if(global.lang != "en") { show_debug("PC Only Speaks English!"); exit; }

if(s_string_to_speak == "") { 
	show_debug("_TTS_PC null string to speak"); 
} else {
	var slow_con = false;
	
	if(is_online) {
		//Todo: check for local responses cache
		//Todo: check for local cached payload id
		
		var t_lang = "en-us";
		if(string_pos("en", s_requested_langauge) > 0){
			s_requested_langauge = "en";
		}
		switch(s_requested_langauge) {
			default:
			case "en": {
				t_lang = "en-us";
				
				break;
			}
			case "id": {
				t_lang = "id-ID";
				break;
			}
			case "my": {
				t_lang = "ms-ID";
				break;
			}
			case "pt": {
				t_lang = "pt-PT";
				break;
			}
			case "es": {
				t_lang = "es-LA";
				break;
			}
			case "vi": {
				t_lang = "vi-VN";
				break;
			}
			case "ne": {
				t_lang = "ne-NP";
				break;
			}
			case "bn": {
				t_lang = "bn-IN";
				break;
			}
			case "hi": {
				t_lang = "hi-IN";
				break;
			}
			case "te": {
				t_lang = "te-IN";
				break;
			}
			case "th":{
				t_lang = "th-TH";
				break;
			}
		}
		
		
	} else {
		//We are offline
		//Todo: check for local response cache entry before defaulting to local device.
		if(0) {
			//Check Cache
		} else { 
			//if not in cache
			//if(global.lang != "en") { show_debug("PC Only Speaks English!"); exit; }
			if(b_force_speak || scp_is_offline_tts_available()) {
				var ret_id = PC_TTS_Speak_Async(s_string_to_speak);
				show_debug("TTS Async called with id: " + string(ret_id));
				qs_list_add(ret_list, ret_id);
				b_force_speak = false;
			}
		}
	}
}
