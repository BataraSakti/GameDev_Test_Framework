/// @description scp_tts_pc_speak(string, language);
/// @function scp_tts_pc_speak
/// @param string
/// @param language
function scp_tts_pc_speak(argument0, argument1) {

	scp_tts_pc_checkcreate();

	with(instance_find(_TTS_PC,0)) {
		s_string_to_speak = string(argument0);
		s_requested_langauge = string(argument1);
		event_user(0);
	}


}
