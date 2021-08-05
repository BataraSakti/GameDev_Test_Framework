// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scp_mg_0_check_if_data_preloaded(){
	with(gui_mg_0){
		if(preloaded_eval_data_type_1 && preloaded_eval_data_type_2 && preloaded_eval_data_type_3 && preloaded_eval_data_type_4 && preloaded_eval_data_type_5 && preloaded_eval_data_type_6){
		
			//tell meta that we've finished preloading
			eval_data_preloaded = true;
			scp_file_close_json(eval_game_data);
			
			with(gui_mg_0){
			    event_user(7);
			}
			
		}
	}
}