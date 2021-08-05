/// @description scp_tts_pc_speak_blocking(string);
/// @function scp_tts_pc_speak_blocking
/// @param string
function scp_tts_pc_speak_blocking(argument0) {

	scp_tts_pc_checkcreate();

	with(instance_find(_TTS_PC,0)) {
		s_string_to_speak = string(argument0);
		event_user(1);
	}


}
