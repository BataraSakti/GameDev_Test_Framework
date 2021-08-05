/// @description scp_tts_pc_get_voice_name(index);
/// @function scp_tts_pc_get_voice_name
/// @param index
function scp_tts_pc_get_voice_name(argument0) {

	scp_tts_pc_checkcreate();

	with(instance_find(_TTS_PC,0)) {
		var sz = qs_list_size(m_PC_TTS_Available_Voices);	
		var rt = qs_list_find_value(m_PC_TTS_Available_Voices, clamp(argument0, 0, sz));
	 
		if(is_undefined(rt)) {
			return PC_TTS_DEFAULTVOICE;
		} else {
			return rt;
		}	 
	}
}
