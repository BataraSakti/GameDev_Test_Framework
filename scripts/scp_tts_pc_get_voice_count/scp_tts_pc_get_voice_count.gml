/// @description scp_tts_pc_get_voice_count();
/// @function scp_tts_pc_get_voice_count
function scp_tts_pc_get_voice_count() {

	scp_tts_pc_checkcreate();

	with(instance_find(_TTS_PC,0)) {
		return qs_list_size(m_PC_TTS_Available_Voices);	 
	}
}
