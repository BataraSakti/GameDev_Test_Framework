if(!ds_exists(async_load, ds_type_map)) { show_debug("async map missing _TTS");  exit; } //Prevent a crash if the data structure is missing.
var t_tt = ds_map_find_value(async_load, "type");
var ret_text = "";

switch(t_tt) {
    case "CW_TTS": {
        //show_debug("Speech To Text ASYNC Response");
        ret_text=ds_map_find_value(async_load, "done");
        
        if(!is_undefined(ret_text)) {
            show_debug("TTS ASYNC Response --- Done");
        }
        
        ret_text=ds_map_find_value(async_load, "error");
        
        if(!is_undefined(ret_text)) {
            show_debug("TTS ASYNC Response --- Error");
        }
        
        ret_text=ds_map_find_value(async_load, "start");
        
        if(!is_undefined(ret_text)) {
            show_debug("TTS ASYNC Response --- Start");
        }
        break;
    }
	case "CW_TTS_FORCE_RESTART":{
		CW_TTS_Force_Restart();
		break;
	}
}



