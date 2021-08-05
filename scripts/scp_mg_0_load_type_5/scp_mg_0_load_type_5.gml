/// @description scp_mg_0_load_type_5(mode_5_count)
/// @function scp_mg_0_load_type_5
/// @param mode_5_count
function scp_mg_0_load_type_5(argument0) {

	show_debug_message("Load MG0 Type 5 Data");

	var mode_5_count = argument0;

	//need to empty the array since we will get the data again from the start, otherwise it will be added by the duplicate values
	eval_game5_values = [];
	eval_game5_answers = [];

	//Type 4 - Make a sentance
	var jar = "Game_5.";
	for(var jj = 1; jj <= mode_5_count; jj++) {
	    var tar = jar + "R"+string(jj)+".String";
	    var temp_string = scp_read_json(eval_game_data, tar);
    
	    //show_debug_message("Add String --- " + string(temp_string));
                
	    tar = jar + "R"+string(jj)+".Answer";
	    var temp_answer = scp_read_json(eval_game_data, tar);
    
	    //show_debug_message("Add Answer --- " + string(temp_answer));
    
	    var sz = 0; 
	    sz = array_length(eval_game5_values);
	    eval_game5_values[sz] = temp_string;
    
	    sz = 0; 
	    sz = array_length(eval_game5_answers);
	    eval_game5_answers[sz] = temp_answer;
	}

	//if minigame is waiting for data tell it its finished loading
	
	preloaded_eval_data_type_5 = true;
	scp_mg_0_check_if_data_preloaded();
	

	show_debug_message(" --- Finished eval game data loading --- ");
}
