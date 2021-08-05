/// @description scp_mg_0_load_type_4(mode_4_count)
/// @function scp_mg_0_load_type_4
/// @param mode_4_count
function scp_mg_0_load_type_4(argument0) {

	show_debug_message("Load MG0 Type 3 Data");

	var mode_4_count = argument0;

	//need to empty the array since we will get the data again from the start, otherwise it will be added by the duplicate values
	eval_game4_values = [];
	eval_game4_display = [];
	eval_game4_answers = [];

	//Type3 - fill in the blank
	var jar = "Game_4.";
	for(var jj = 1; jj <= mode_4_count; jj++) {
	    tar = jar + "R"+string(jj)+".String";
	    var temp_string = scp_read_json(eval_game_data, tar);
    
	    //show_debug_message("Add String --- " + string(temp_string));
                
	    tar = jar + "R"+string(jj)+".Answer";
	    var temp_answer = scp_read_json(eval_game_data, tar);
    
	    //show_debug_message("Add Answer --- " + string(temp_answer));
    
	    tar = jar + "R"+string(jj)+".Values";
	    var temp_value = scp_read_json(eval_game_data, tar);
    
	    //show_debug_message("Add Values --- " + string(temp_value));
    
	    var sz = 0; 
	    sz = array_length(eval_game4_display);
	    eval_game4_display[sz] = temp_string;
    
	    sz = 0; 
	    sz = array_length(eval_game4_answers);
	    eval_game4_answers[sz] = temp_answer;
    
	    sz = 0; 
		sz = array_length(eval_game4_values);
	    eval_game4_values[sz] = temp_value;
	}

	
	preloaded_eval_data_type_4 = true;
	scp_mg_0_check_if_data_preloaded();
	
}
