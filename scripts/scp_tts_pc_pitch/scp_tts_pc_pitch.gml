/// @description scp_tts_pc_pitch(double);
/// @function scp_tts_pc_pitch
/// @param double
function scp_tts_pc_pitch(argument0) {

	scp_tts_pc_checkcreate();

	with(instance_find(_TTS_PC,0)) {
		PC_TTS_setPitch(clamp(argument0,PC_TTS_MinPitch,PC_TTS_MaxPitch));
		m_PC_TTS_Pitch = PC_TTS_getPitch();
		return m_PC_TTS_Pitch;
	}


}
