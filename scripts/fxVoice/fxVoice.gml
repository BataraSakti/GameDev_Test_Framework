/// @description fxVoice([string, language_code, force_speak])
/// @function fxVoice
/// @param [string
/// @param  language_code
/// @param  force_speak]
function fxVoice() {

	var arg_count = argument_count;
	var t_txt = "";
	var t_lang = global.lang;
	if (arg_count == 1){
	    t_txt = string(argument[0]);
	} else if (arg_count == 2) {
	    t_txt = string(argument[0]);
	    t_lang = argument[1];
	}

	var fs_ = false;
	if(arg_count == 3) { fs_ = real(argument[2]); }

	//disabled the TTS when in non EN MG
	//see https://jira.solveeducation.org/browse/DOC-7148 for more details
	

	//var t_txt = string(argument0);
	if(t_txt != "") {
	    if(global.button_speak == true || fs_) {
	        //if(global.isLowram == false) { //only android sets lowram so why are we checking this twice?
			
				
			
	            show_debug("TTS with text: " + string(t_txt));

				tts_speak(t_txt, t_lang, "", "", "", fs_);
            
	            return true;
	        // else {
	        //    show_debug("NO TTS: LOW RAM");
	        //    return false;
	        //}
	    } else {
	        return false;
	    }
	} else {
	    return false;
	}
}
