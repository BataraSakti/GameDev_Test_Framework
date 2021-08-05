/// @description Setup

if (singleton()) {exit;}
//Setable
s_string_to_speak = "Hello World!";
s_requested_langauge = "en";

//Internals 
b_is_speaking = false;
soundId = noone;
i_buff_length = 0;
i_audio_time = 0;
audio_buffer = noone;
audio_return_data = "";
i_audio_rate = AUDIO_16k;
b_force_default_rates = true;
b_force_speak = false;
is_online = false;

//Async Management
ret_list = qs_list_create();
delay_list = qs_list_create();



//Select Voice from options...
show_debug("Getting TTS Voices");
m_PC_TTS_Available_Voices = scp_tts_pc_voices_list();
if(qs_list_size(m_PC_TTS_Available_Voices) > 0) {
	//Set the default voice in the stack
	var tvvv = string(qs_list_find_value(m_PC_TTS_Available_Voices,0));
	show_debug("Setting default voice to: " + tvvv);
	PC_TTS_setVoice(tvvv);
}
	
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


cloud_tts_data = "";
