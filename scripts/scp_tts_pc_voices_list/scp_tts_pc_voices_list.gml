/// @description scp_tts_pc_voices_list();
/// @function scp_tts_pc_voices_list
function scp_tts_pc_voices_list() {

	// Note - returns a live ds_map - you must destroy this when done.

	var t_json = PC_TTS_getInstalledVoices();
	show_debug(t_json);

	var t_map = qs_json_decode(t_json);
	var v_list = qs_map_find_value(t_map, "voices");
	var t_voice_list = qs_list_create();

	if(qs_exists(v_list, ds_type_list)) {
		var size = qs_list_size(v_list);
		for(var i = 0; i < size; i++) {
			var key_l = qs_list_find_value(v_list, i);
			//show_debug("v_list index " + string(i) + ": " + string(key_l));	
			if(qs_exists(key_l, ds_type_map)) {
				var k_name = qs_map_find_value(key_l,"name");
				if(!is_undefined(k_name)) {
					show_debug("Adding voice: " + string(k_name));
					qs_list_add(t_voice_list, k_name);
				}
			}
		}
	} 

	//qs_map_destroy(t_map);  //Causes an illigal array use crash? 

	return t_voice_list;


}
