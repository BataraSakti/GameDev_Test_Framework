/// @description Respond to TTS payload data from online 
if(cloud_tts_data != "") {
	//show_debug("Cloud TTS Speaks: " + string(s_string_to_speak));
	scp_tts_pc_play_string_sound(cloud_tts_data, AUDIO_22k, s_string_to_speak);
	cloud_tts_data = "";
}