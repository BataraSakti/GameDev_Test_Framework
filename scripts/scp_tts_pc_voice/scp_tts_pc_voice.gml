/// @description scp_tts_pc_voice(string);
/// @function scp_tts_pc_voice
/// @param string
function scp_tts_pc_voice(argument0) {

	scp_tts_pc_checkcreate();

	with(instance_find(_TTS_PC,0)) {
		PC_TTS_setVoice(string(argument0));
		m_PC_TTS_Voice = PC_TTS_getVoice();	
		return m_PC_TTS_Voice;
	}


}
