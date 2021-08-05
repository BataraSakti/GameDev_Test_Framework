function forceVoice() {

	///forceVoice([string, language_code])
	var arg_count = argument_count;
	var t_txt = "";
	var t_lang = "";
	if (arg_count == 1){
	    t_txt = string(argument[0]);
	} else if (arg_count == 2) {
	    t_txt = string(argument[0]);
	    t_lang = argument[1];
	}

	

	//var t_txt = string(argument0);
	if(t_txt != "") {
		if (t_lang != ""){
	        tts_speak(t_txt, t_lang, "", "", "", true);
	    } else {
	        tts_speak(t_txt, "en", "", "", "", true);
	    }
		
		show_debug("TTS force with text ---- " + string(t_txt));
	} else {
	    return false;
	}
	
}
