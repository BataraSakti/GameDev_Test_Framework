global.fontset = 0;
global.button_speak = true;
global.lang = "en";
global.rot = 0;
global.layer_user_confirm = layer_exists_create(-20000);
global.font = -1;
global.g_ui_time        = 0.67
global.layer_controllers = layer_exists_create(0);
global.usePC_TTS = false;
global.tts_init = false;
#macro PC_TTS_DOTNET "DOTNET"
#macro IS_DEBUG 1
#macro SHOW_SCHEDULER_LOGS 1
if(os_type != os_android) {
		
		if(!instance_exists(_TTS_PC)) {
		    instance_create_layer(0, 0, global.layer_controllers, _TTS_PC);
		}
	
		global.usePC_TTS = true;
	} else {
		//Prime Android TTS
		tts_speak(" ");
	}
instance_create_layer(room_width/2, room_height/2, layer_create(-100), gui_mg_0);