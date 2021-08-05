/// @description scp_tts_pc_checkcreate();
/// @function scp_tts_pc_checkcreate
function scp_tts_pc_checkcreate() {

	if(instance_number(_TTS_PC) < 1) {
		show_debug("_TTS_PC missing! Create it!");
		instance_create_layer(0,0, "Instances", _TTS_PC);
	} 



}
