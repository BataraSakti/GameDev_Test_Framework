/// @description scp_mg_0_load_type_3(mode_3_count)
/// @function scp_mg_0_load_type_3
/// @param mode_3_count
function scp_mg_0_load_type_3(argument0) {

	show_debug_message("Load MG0 Type 3 Data");

	var mode_3_count = argument0;

	//need to empty the array since we will get the data again from the start, otherwise it will be added by the duplicate values
	eval_game3_values = [];
	eval_game3_display = [];
	eval_game3_answers = [];

	//Type3 - fill in the blank
	var jar = "Game_3.";
	for(var jj = 1; jj <= mode_3_count; jj++) {
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
	    sz = array_length(eval_game3_display);

	    eval_game3_display[sz] = temp_string;
    
	    sz = 0; 
	    sz = array_length(eval_game3_answers);
	    eval_game3_answers[sz] = temp_answer;
    
	    sz = 0; 
	    sz = array_length(eval_game3_values);

	    eval_game3_values[sz] = temp_value;
	}

	
	preloaded_eval_data_type_3 = true;
	scp_mg_0_check_if_data_preloaded();
	
}
