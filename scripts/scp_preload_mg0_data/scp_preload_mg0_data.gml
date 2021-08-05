// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scp_preload_mg0_data(){
	if(!eval_data_preloaded){
	    //Load the json
	    if(!has_preloaded_eval) { 
			
			has_preloaded_eval = 1;
			if(eval_game_data != noone) { 
				scp_file_close_json(eval_game_data);
			}
			
			var tt_file = "DB_MG0.json";			
			eval_game_data = scp_file_open_json(tt_file);
			
		}
	
		
    
	    var jar = "C.";
	    tar = jar + "N2";
	    mode_2_count = real(scp_read_json(eval_game_data, tar));
	    tar = jar + "N3";
	    mode_3_count = real(scp_read_json(eval_game_data, tar));
		tar = jar + "N4";
		mode_4_count = real(scp_read_json(eval_game_data, tar));
	    tar = jar + "N5";
	    mode_5_count = real(scp_read_json(eval_game_data, tar));
		tar = jar + "N6";
	    mode_6_count = real(scp_read_json(eval_game_data, tar));
	
		
		preloaded_eval_data_type_1 = false;
		preloaded_eval_data_type_2 = false;
		preloaded_eval_data_type_3 = false;
		preloaded_eval_data_type_4 = false;
		preloaded_eval_data_type_5 = false;
		preloaded_eval_data_type_6 = false;
		
	
	   
		scp_mg_0_load_type_1();
		scp_mg_0_load_type_2(mode_2_count);
		scp_mg_0_load_type_3(mode_3_count);
		scp_mg_0_load_type_4(mode_4_count);
		scp_mg_0_load_type_5(mode_5_count);
		scp_mg_0_load_type_6(mode_6_count);
	    
	}else{
	    show_debug_message("Eval data already preloaded!");
	}
}