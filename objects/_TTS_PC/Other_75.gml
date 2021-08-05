/// @description PC_TTS callbacks
if(!ds_exists(async_load, ds_type_map)) { show_debug("async map missing _TTS_PC"); exit; } //Prevent a crash if the data structure is missing.

var t_type = async_load[? "type"]; 

if(t_type != "tts_pc") {
	//show_debug("Not TTS_PC Async Event!");
	exit;
}

var ret_id = async_load[? "id"]; //Needs to be value returned by speak_async(string) 
var t_pos = qs_list_find_index(ret_list, ret_id);
if(!is_undefined(t_pos) && t_pos >= 0) {
	//This is a call we made!  
	var data_async   = async_load[? "data"]; //data should be "pc_tts_data"
	var data_engine  = async_load[? "engine"]; //data should be "pc_tts_data"
	var status_async = async_load[? "tts_pc_status"]; //should return error codes / status data of the request
	var data_string  = async_load[? "tts_pc_string"]; //The string translated
	//show_debug(string(data_async));
	
	//Clean up call from callbacks list
	qs_list_delete(ret_list, t_pos);
	
	if(real(status_async) == 0) {
		//Play it
		if(b_force_default_rates) {
			if(data_engine == PC_TTS_DOTNET) {
				if(i_audio_rate != AUDIO_22k) {
					i_audio_rate = scp_tts_pc_playbackaudiorate(AUDIO_22k);
				}
			} else {
				if(i_audio_rate != AUDIO_16k) {
					i_audio_rate = scp_tts_pc_playbackaudiorate(AUDIO_16k);
				}
			}	
		}
		scp_tts_pc_play_string_sound(data_async, i_audio_rate, data_string);
	} else {
		show_debug("TTS_PC: Async error: " + string(status_async));	
	}	
} else {
	//This call was not for us	
	show_debug("TTS_PC: Async call not for us: " + string(ret_id));
}
