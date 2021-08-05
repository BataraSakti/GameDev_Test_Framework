/// @description scp_mg_0_load_type_1()
/// @function scp_mg_0_load_type_1
function scp_mg_0_load_type_1() {

	ds_list_clear(eval_game1_numbers);
	ds_list_clear(eval_game1_letters);
	//Type 1

	//Numbers
	var jar = "Game_1.";
	var tar = jar + "R1.String";
	var temp_string = scp_read_json(eval_game_data, tar);
	temp_string = scp_split_string(temp_string, ",");

	for(var i = 0; i < array_length_1d(temp_string); i++) {
	    //show_debug_message("Add Number --- " + string(temp_string[i]));
	    ds_list_add(eval_game1_numbers, temp_string[i]);
	}

	//Letters
	tar = jar + "R2.String";
	temp_string = scp_read_json(eval_game_data, tar);
	temp_string = scp_split_string(temp_string, ",");

	for(var i = 0; i < array_length_1d(temp_string); i++) {
	    //show_debug_message("Add Letters --- " + string(temp_string[i]));
	    ds_list_add(eval_game1_letters, temp_string[i]);
	}


	preloaded_eval_data_type_1 = true;
	scp_mg_0_check_if_data_preloaded();
	
}
