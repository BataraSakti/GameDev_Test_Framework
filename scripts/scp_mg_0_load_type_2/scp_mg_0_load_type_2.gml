/// @description scp_mg_0_load_type_2(mode_2_count)
/// @function scp_mg_0_load_type_2
/// @param mode_2_count
function scp_mg_0_load_type_2(argument0) {

	show_debug_message("Load MG0 Type 2 Data");

	var mode_2_count = argument0;

	eval_game2_type1_cats = [];
	eval_game2_type1_answers = [];
	eval_game2_type1_distractions = [];
	eval_game2_type2_cats = [];
	eval_game2_type2_answers = [];
	eval_game2_type2_distractions = [];

	//Type 2 - Pick 3 from X,Y,ZZZZ
	var jar = "Game_2.";
	for(var jj = 1; jj <= mode_2_count; jj++) {
	    var tar = jar + "R"+string(jj)+".Type";
	    temp_type = real(scp_read_json(eval_game_data, tar));

	    switch(temp_type) {
	        case 1: {
	            tar = jar + "R"+string(jj)+".Cat";
	            var temp_cat = scp_read_json(eval_game_data, tar);
            
	            //show_debug_message("Add Cat --- " + string(temp_cat));
            
	            tar = jar + "R"+string(jj)+".String";
	            var temp_string = scp_read_json(eval_game_data, tar);
            
	            //show_debug_message("Add Words --- " + string(temp_string));
                        
	            tar = jar + "R"+string(jj)+".Values";
	            var temp_value = scp_read_json(eval_game_data, tar);
            
	            //show_debug_message("Add Distractions --- " + string(temp_value));
            
	            var sz = array_length(eval_game2_type1_cats);
	            eval_game2_type1_cats[sz] = temp_cat;
            
	            var sz = array_length(eval_game2_type1_answers);
	            eval_game2_type1_answers[sz] = temp_string;
            
	            var sz = array_length(eval_game2_type1_distractions);
	            eval_game2_type1_distractions[sz] = temp_value;
	            break;
	        }
	        case 2: {
	            tar = jar + "R"+string(jj)+".Cat";
	            var temp_cat = scp_read_json(eval_game_data, tar);
            
	            //show_debug_message("Add Cat --- " + string(temp_cat));
            
	            tar = jar + "R"+string(jj)+".String";
	            var temp_string = scp_read_json(eval_game_data, tar);
            
	            //show_debug_message("Add Words --- " + string(temp_string));
                        
	            tar = jar + "R"+string(jj)+".Values";
	            var temp_value = scp_read_json(eval_game_data, tar);
            
	            //show_debug_message("Add Distractions --- " + string(temp_value));
            
	            var sz = array_length(eval_game2_type2_cats);
	            eval_game2_type2_cats[sz] = temp_cat;
            
	            var sz = array_length(eval_game2_type2_answers);
	            eval_game2_type2_answers[sz] = temp_string;
            
	            var sz = array_length(eval_game2_type2_distractions);
	            eval_game2_type2_distractions[sz] = temp_value;
	            break;
	        }
	    }
	}

	
	preloaded_eval_data_type_2 = true;
	scp_mg_0_check_if_data_preloaded();
	
}
