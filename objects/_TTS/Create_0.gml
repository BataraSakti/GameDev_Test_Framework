/// @description Create stuff 
if(instance_number(_TTS) > 1) {
    show_debug("Only One Instance of _TTS Allowed");
    no_cleanup = true;
    instance_destroy();
    exit;
}

no_cleanup = false;


show_debug("_TTS INIT TTS GMS");
CW_TTS_Init(); 
   


is_kill = false;
if(is_kill == false) {
    CW_TTS_AutoKill(false);
}

tts_que = false; //Start fresh, do not add new lines.
tts_string = "Well, that's certainly good to know. Then maybe you should consider this: if anything happens to them, Starfleet is going to want a full investigation. When has justice ever been as simple as a rule book? About four years. I got tired of hearing how young I looked. Besides, you look good in a dress.";
tts_lang ="en";
tts_update_rate = 1.0;

tts_update_rate = 0.8;
tts_current_rate = 1.0;


