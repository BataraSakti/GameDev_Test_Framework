/// @description tts_speak(string, [language, droid_add_que, pc_pitch, pc_speed, pc_force_speak])
/// @function tts_speak
/// @param string
/// @param  [language
/// @param  droid_add_que
/// @param  pc_pitch
/// @param  pc_speed
/// @param  pc_force_speak]
function tts_speak() {
	var t_ccc = argument_count;
	var t_rdy = true;
	var _ttext = argument[0];
	_ttext = string_replace_all(_ttext, "\n", " ");
	_ttext = string_replace_all(_ttext, "-", " ");

	var t_lng = "en";
	if(t_ccc >= 2) { t_lng = argument[1]; }
	
	if(global.usePC_TTS) {
		if(_ttext != "") {
			if(t_ccc >= 4) { var ttpt = argument[3]; if(ttpt != "") { scp_tts_pc_pitch(ttpt); }}
			if(t_ccc >= 5) { var ttpr = argument[4]; if(ttpr != "") { scp_tts_pc_rate(ttpr); }}
			if(t_ccc >= 6) { var ttfv = argument[5]; if(ttfv) { _TTS_PC.b_force_speak = true; }}
			show_debug("PC TTS: " + string(_ttext));
			if (string_pos("en", t_lng) > 0){
				scp_tts_pc_speak(_ttext, t_lng);
			} else {
				show_debug("DUD PC TTS other than EN language is disabled.. current lang : "+string(t_lng)); //see https://jira.solveeducation.org/browse/DOC-6110
			}
		}
		exit;
	} else if ((t_ccc > 3) && !IS_PC){
		t_ccc = 3;
	}

	//lobal.tts_init Must be defined in the projects globals durring startup.
	if(global.tts_init == false) {
	    show_debug("tts_speak INIT TTS GMS");
	    CW_TTS_Init(); 
		CW_TTS_UseDefaultSettings(0.0);
	    //CW_TTS_Set_Language(global.lang);
	    global.tts_init = true;
	    t_rdy = false;
	} else {
	    if(instance_number(_TTS) == 0) { instance_create_layer(0,0, global.layer_controllers,_TTS); }
	
		// force TTS_English for BrainBattle and WordSnap
		

	    if(CW_TTS_Available() == false) {
	        //CW_TTS_Install();
	        t_rdy = false;
	    } else {
			show_debug("tts_speak speak string - " + string(_ttext));
	        if (string_pos("en", t_lng) > 0){
				if(t_ccc == 1) {
		            with(_TTS) {
		                tts_string = _ttext;
		            }
		        } else if(t_ccc == 2) {
		            with(_TTS) {
		                tts_string = _ttext;
		                tts_lang = t_lng;
		            }
		        } else if (t_ccc == 3) {
		            with(_TTS) {
		                tts_string = _ttext;
		                tts_lang = t_lng;
						if(argument[2] != "") { tts_que = argument[2]; }
		            }        
		        } else {
		            t_rdy = false;
		        }
			}else{
				show_debug("DUD android TTS other than EN language is disabled.. current lang : "+string(t_lng)); //see https://jira.solveeducation.org/browse/DOC-6110
				exit;
			}
	    }
	}

	if(t_rdy == true) {
	    perform_event(_TTS, 0);
	} else {
	    switch(t_ccc) {
	        case 1: {
	            if(_ttext == "") { exit; } //Allows warmup
            
	            ScheduleScript(_TTS, true, 0.1, tts_speak, _ttext);
	            break;
	        }
	        case 2: {
	            ScheduleScript(_TTS, true, 0.1, tts_speak, _ttext,t_lng);
	            break;
	        }
	        case 3: {
	            ScheduleScript(_TTS, true, 0.1, tts_speak, _ttext,t_lng,argument[2]);
	            break;
	        }

	        default : {
	            show_debug("Wrong number of arguments for tts_speak --- " + string(t_ccc));
	            break;
	        }
	    }
	}



}
