/// @description scp_play_string_sound(base64_audio_string, i_audio_rate, string);
/// @function scp_play_string_sound
/// @param base64_audio_string
/// @param i_audio_rate
/// @param string
function scp_tts_pc_play_string_sound(argument0, argument1, argument2) {

	if(object_get_name(object_index) != "_TTS_PC") { 
		show_debug("ERROR: TTS_PC scp_play_string_sound wrong object");
		exit;
	}

	if(argument0 == "" || is_undefined(argument0)) { show_debug("TTS No Data"); exit; }

	if(b_is_speaking == false) {
		b_is_speaking = true;
	
		audio_buffer = buffer_base64_decode(argument0);	
		i_buff_length = buffer_get_size(audio_buffer);

		show_debug("TTS Create sound from buffer len: " + string(i_buff_length) + " dat: " + string(audio_buffer));

		soundId = audio_create_buffer_sound(audio_buffer, buffer_s16, argument1, 0, i_buff_length, audio_mono);
	
		if(!is_undefined(soundId)) { 
			audio_play_sound(soundId, 10, false);
	
			i_audio_time = abs(audio_sound_length(soundId));
			show_debug("TTS_PC Play: " + string(argument2) + " :: time: " + string(i_audio_time) + " rate: " + string(i_audio_rate));
	
			alarm[0] = ceil(i_audio_time*room_speed); //Alarm timing is not as accurate as delta time!		
		} else {
			show_debug("TTS Bad Sound Generation"); 
			i_audio_time = 0.35;
			alarm[0] = ceil(i_audio_time*room_speed); 
		}
	} else {
		show_debug("TTS_PC Can't speak - reschedule speaking");
	
		var tsz = qs_list_size(delay_list);
		if(tsz < 3) { 	
			show_debug("TTS_PC TTS Que Full - replace last entry with current request");
			qs_list_delete(delay_list, tsz-1);
		}
		
		var t_map = qs_map_create();
		qs_map_add(t_map, "arg0", argument0);
		qs_map_add(t_map, "arg1", argument1);
		qs_map_add(t_map, "arg2", argument2);
		var t_json = qs_json_encode(t_map);
		qs_map_destroy(t_map);
	
		qs_list_add(delay_list, t_json);
	}
}
