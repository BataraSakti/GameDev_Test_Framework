tts_string = string_replace_all(tts_string, "\n", " ");
tts_string = string_lower(tts_string);

if(tts_lang == "en"){
	if(tts_current_rate != tts_update_rate){
		tts_current_rate = tts_update_rate;
		CW_TTS_UpdateSpeechRate(tts_current_rate);
	}
	
} else {
	if(tts_current_rate != 1.0){
		tts_current_rate = 1.0;
		CW_TTS_UpdateSpeechRate(tts_current_rate);
	}
}

if (string_pos("en", tts_lang) > 0){
	if(global.support_local_en){
		if(tts_lang != global.lang_en_country){
			tts_lang = global.lang_en_country;
		}
	}
}

CW_TTS_Speak(tts_string, tts_que, tts_lang);
