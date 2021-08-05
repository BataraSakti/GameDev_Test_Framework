/// @description scp_tts_pc_rate(double);
/// @function scp_tts_pc_rate
/// @param double
function scp_tts_pc_rate(argument0) {

	scp_tts_pc_checkcreate();

	with(instance_find(_TTS_PC,0)) {
		PC_TTS_setRate(clamp(argument0,PC_TTS_MinRate,PC_TTS_MaxRate));
		m_PC_TTS_Rate = PC_TTS_getRate();
		return m_PC_TTS_Rate;
	}


}
