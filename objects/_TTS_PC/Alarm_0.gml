/// @description Reset after speaking

//clean up
if(soundId != noone) {
	audio_free_buffer_sound(soundId);
	soundId = noone;
}

if(audio_buffer != noone && buffer_exists(audio_buffer)) {
	buffer_delete(audio_buffer);
	audio_buffer = noone;
}

i_buff_length = 0;
i_audio_time = 0;
audio_return_data = "";
b_is_speaking = false;
audio_return_data = "";

if(qs_list_size(delay_list) > 0) {
	show_debug("TTS_PC Playing Cached Call");
	var t_map = qs_json_decode(qs_list_find_value(delay_list, 0));
	show_debug("TTS_PC Cached Call Data: " + string(t_map[1][? "arg0"]) + " : " + string(t_map[1][? "arg1"]) + " : " + string(t_map[1][? "arg2"]));
	qs_list_delete(delay_list,0);
	
	scp_tts_pc_play_string_sound(t_map[1][? "arg0"],t_map[1][? "arg1"],t_map[1][? "arg2"]);
	qs_map_destroy(t_map);
}
