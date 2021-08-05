/// @description scp_tts_pc_volume(int);
/// @function scp_tts_pc_volume
/// @param string
function scp_tts_pc_volume(argument0) {

	scp_tts_pc_checkcreate();

	with(instance_find(_TTS_PC,0)) {
		PC_TTS_setVolume(clamp(argument0,PC_TTS_MinVolume,PC_TTS_MaxVolume));
		m_PC_TTS_Volume = PC_TTS_getVolume();
		return m_PC_TTS_Volume;
	}


}
