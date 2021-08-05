///@description scp_is_offline_tts_available([lang_code]) 
///@function scp_is_offline_tts_available
///@param optional - language code to check
function scp_is_offline_tts_available() {

	var ttl_lang = global.lang;

	if(argument_count > 0) {
		ttl_lang = argument[0];
	}

	var tt_is_valid = false; 

	switch(ttl_lang) {
		case "id":
		case "my":
		case "pt":
		case "es":
		case "en": {
			tt_is_valid = true;
			break;
		}
		default: { 
			tt_is_valid = false;
			break;
		}
	}

	return tt_is_valid;


}
