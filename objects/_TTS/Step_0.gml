/// @description

if(!global.isPC && os_is_paused()){
	//alarm_set(0,1);
	show_debug("_TTS step warming the tts on paused os");
	tts_speak("");
}
