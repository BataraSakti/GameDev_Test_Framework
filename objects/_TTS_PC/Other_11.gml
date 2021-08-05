/// @description Speak
//if(global.lang != "en") { show_debug("PC Only Speaks English!"); exit; }

if(b_is_speaking == false) {
	audio_return_data = PC_TTS_Speak(s_string_to_speak);	
	//show_debug(string(audio_return_data));
	
	if(is_online) {
		//Todo: check for local responses cache
		//Todo: check for local cached payload id
		
		var t_lang = "en-us";
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
				t_lang = "pt-BR";
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
			
			//DOTNET only 22k
			scp_tts_pc_play_string_sound(audio_return_data, AUDIO_22k, s_string_to_speak);
			b_is_speaking = true; //After because above script will fail otherwise
		}
	}
		
} else {
	show_debug("TTS_PC Can't speak blocking - already speaking");	
}