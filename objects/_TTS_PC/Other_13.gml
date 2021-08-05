/// @description Set and save voice / offline only!
if(!is_online){
	if(variable_instance_exists(other,"action_id") && is_string(other.action_id)){
		show_debug("Setting default voice to: " + other.action_id);
		PC_TTS_setVoice(other.action_id);
		//set players variable so we can save it later
		
		//Get Settings
		show_debug("Getting TTS Rate");
		m_PC_TTS_Rate   = PC_TTS_getRate(); //0.5 - 6.0
		show_debug("Getting TTS Pitch");
		m_PC_TTS_Pitch  = PC_TTS_getPitch(); //0.0 - 2.0 [1.0 default] Windows 10 Async Only
		show_debug("Getting TTS Volume");
		m_PC_TTS_Volume = PC_TTS_getVolume(); //0.0 - 1.0
		show_debug("Getting TTS Current Voice");
		m_PC_TTS_Voice  = PC_TTS_getVoice(); //[Microsoft David default]
	
		show_debug("m_PC_TTS_Rate: " + string(m_PC_TTS_Rate) + "\n" +
			"m_PC_TTS_Pitch: " + string(m_PC_TTS_Pitch) + "\n" +
			"m_PC_TTS_Volume: " + string(m_PC_TTS_Volume) + "\n" +
			"m_PC_TTS_Voice: " + string(m_PC_TTS_Voice));

	}else{
		show_debug("_TTS_PC ERROR --> Entered event 3 with action_id which is not string!");
	
	}
}else{
	show_debug("_TTS_PC - Event 3 --> User is online!");
}