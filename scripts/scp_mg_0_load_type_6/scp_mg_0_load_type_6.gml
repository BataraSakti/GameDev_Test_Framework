function scp_mg_0_load_type_6(argument0) {
	show_debug_message("Load MG0 Type 6 Data");

	var mode_6_count = argument0;

	//need to empty the array since we will get the data again from the start, otherwise it will be added by the duplicate values
	eval_game6_values = [];
	eval_game6_answers = [];
	eval_game6_option = [];

	//Type 4 - Make a sentance
	var jar = "Game_6.";
	for(var jj = 1; jj <= mode_6_count; jj++) {
	    var tar = jar + "R"+string(jj)+".Passage";
	    var temp_string = scp_read_json(eval_game_data, tar);
	
	    //show_debug_message("Add String --- " + string(temp_string));
                
	    var tar_answer = jar + "R"+string(jj)+".Answer";
	    var temp_answer = scp_read_json(eval_game_data, tar_answer);
		temp_answer = string_replace_all(temp_answer, "&amp;", "&");
    
	    //show_debug_message("Add Answer --- " + string(temp_answer));

		var opt_A = scp_read_json(eval_game_data, jar + "R"+string(jj)+".A");
		var opt_B = scp_read_json(eval_game_data, jar + "R"+string(jj)+".B");
		var opt_C = scp_read_json(eval_game_data, jar + "R"+string(jj)+".C");
		var opt_D = scp_read_json(eval_game_data, jar + "R"+string(jj)+".D");
		var opt_list = (string(opt_A)+";"+string(opt_B)+";"+string(opt_C)+";"+string(opt_D));
		opt_list = string_replace_all(opt_list, "&amp;", "&");
	
		var sz = 0; 
	    sz = array_length(eval_game6_values);
	    eval_game6_values[sz] = temp_string;
	
		sz = 0; 
	    sz = array_length(eval_game6_answers);
	    eval_game6_answers[sz] = temp_answer;
	
		sz = 0; 
	    sz = array_length(eval_game6_option);
		eval_game6_option[sz] = opt_list;
	}

	//if minigame is waiting for data tell it its finished loading
	
	preloaded_eval_data_type_6 = true;
	scp_mg_0_check_if_data_preloaded();
	

	show_debug_message(" --- Finished eval game data loading --- ");



}
