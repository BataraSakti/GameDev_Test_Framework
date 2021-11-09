/// @description Responder to user tap to play audio / start round
//if(zero_or_value(draw_hand) == 0){
//    alarm[1] = room_speed*2;
//}
show_debug("Draw Hand --- "+string(draw_hand));
switch(display_stage) {
    case 0: {
        //Intro / Tutorial
        break;
    }
    case 1: {
        //Game Type 1 - Select the Leter / Number / Word spoken.
        instance_create_layer(x,y,elements_layer,obj_first_hint);
		//ScheduleEventUser(id,true,1,)
        //Clear Data
        marshmen_values = [];
        marshmen_answers = [];
        inputs = 0;
        input_val = "";
        
        //Get live data. 
        /*Code goes here*/
        
        //Pick one of the marshmen to be correct
       /*Code goes here*/
        
		if (array_length(marshmen_answers) > 0){
	        //Play Audio and start
	        target_text_to_speak = string(marshmen_answers[0]);
	        forceVoice(target_text_to_speak, "en-us");
	        show_debug("Start Round");
		}
        
	    //We actually want to nuke out play audio button - they only get to listen to it once
	    ScheduleScript(id, true, 0.10, perform_event, b_swap, 0);
	    b_swap = noone;
		perform_event(b_volume, 0);
		b_volume = noone;
		
	    ScheduleEventUser(id, true, 1.5, 6); //spawn marshmen
	    tock = true;
	    tick = 0;
	    test_timer_tock = true;
		if(test_cur_round < 2){
			test_timer_tock = false;
		}
		if (array_length(marshmen_answers) > 0){
			array_push(game_1_repeat_question_arr, marshmen_answers[0]);
		}
		
        break;
    }
    case 2: {
        //Game Type 2 - Select the words in the category.
        show_debug("Responsd to user input");

        if(!isType2Started){
            isType2Started = true;
        }
        
        //Clear Data
        marshmen_values = [];
        marshmen_answers = [];
        inputs = 0;
        input_val = "";
        t_list = ds_list_create();
        var num_game2_type1 = array_length(game2_type1_cats);
        var num_game2_type2 = array_length(game2_type2_cats);
		
        switch (type_2_mode) {
            case 1: {
                //Update Instructions...
                var random_index = irandom_range(0, num_game2_type1 - 1);
				
                var t_toptxt = string_replace(text_type_2_top_1, "&&CAT_NAME&&", game2_type1_cats[random_index]);
				var checker = string_count(string(t_toptxt), string(_val_game2_type1));
				
				
                //ds_list_add(randomed_index1, random_index);
                //array_push(_val_game2_type1, t_toptxt);
				
                top_text = string_replace(text_type_2_top_1, "&&CAT_NAME&&", game2_type1_cats[random_index]);
                target_text_to_speak = top_text;
                
                //assign the answers and distraction for the marshmen
				 /*Codes goes here*/
                break;
            }
            case 2: {
                //Update Instructions... 
                var random_index = irandom_range(0, num_game2_type2 - 1);
				show_debug("mg_0 random_index: "+string(random_index)+", _val_game2_type1: "+string(_val_game2_type2));
				
                var t_toptxt = string_replace(text_type_2_top_1, "&&CAT_NAME&&", game2_type2_cats[random_index]);
				var checker = string_count(string(t_toptxt), string(_val_game2_type2));
				//while(ds_list_find_index(randomed_index2, random_index) != -1 || top_text == t_toptxt){
				while(checker > 0 || top_text == t_toptxt){
                    //will find antoher index if already choosen or the category is same as before(consecutively same)
					show_debug("DUD Game_2 type_2_2 same question detected. Randomize again..");
                    random_index = irandom_range(0, num_game2_type2 - 1);
                    t_toptxt = string_replace(text_type_2_top_1, "&&CAT_NAME&&", game2_type2_cats[random_index]);
					checker = string_count(string(t_toptxt), string(_val_game2_type2));
				}
                
                //ds_list_add(randomed_index2, random_index);
				//array_push(_val_game2_type2, t_toptxt);
				
                top_text = string_replace(text_type_2_top_1, "&&CAT_NAME&&", game2_type2_cats[random_index]);
                target_text_to_speak = top_text;
                
               //assign the answers and distraction for the marshmen
				 /*Codes goes here*/
                break;
            }
        }
        
        //Scarmble the value and of the marshmen
       /*Codes goes here*/
                
        //We actually want to nuke out play audio button - they only get to listen to it once
        ScheduleScript(id, true, 0.10, perform_event, b_swap, 0);
        b_swap = noone;
		perform_event(b_volume, 0);
		b_volume = noone;
		
        ScheduleEventUser(id, true, 0.40, 6); //spawn marshmen
        tock = true;
        tick = 0;
        
        //Play Audio and start
        forceVoice(target_text_to_speak, "en");
        show_debug("Start Round");
        break;
    }
    case 3: {
        //Game Type 3 - Select the correct word to complete the sentance.
        //Clear Data
        marshmen_values = [];
        marshmen_answers = [];
        marshmen_display = [];
        inputs = 0;
        input_val = "";
        
        //Update Instructions... 
        target_text_to_speak = top_text;
        
        round_value = cur_round-1;
        

        //Get Values
       //assign the answers and distraction for the marshmen
	   /*Codes goes here*/
        
        //Get the display values 
        show_debug("Display Value ---- " + string(game3_display[round_value]));
        marshmen_display = scp_split_string(game3_display[round_value], " "); 
        var ss = array_length(marshmen_display);
        //Decode / cleanup of display values
        for(var i = 0; i < ss; i++) {
            var tt = string(marshmen_display[i]);
            if(string_count("&amp;c&amp;", tt)) {
                marshmen_display[i] = string_replace(tt, "&amp;c&amp;", ",");
            }
            
            if(string_count("&amp;val&amp;", tt)) {
                marshmen_display[i] = string_replace(tt, "&amp;val&amp;", "");
            }
			
			if(string_count("&quot;", tt)) {
                marshmen_display[i] = string_replace_all(tt, "&quot;", "\"");
            }
        }
        
        show_debug("Display Value ---- " + string(game3_display[round_value]));
        text_blob = game3_display[round_value];
        show_debug("text_blob Value ---- " + string(text_blob));
        text_blob = string_replace(text_blob, "&amp;val&amp;", lst);
        show_debug("text_blob Value 1 ---- " + string(text_blob));
        text_blob = string_replace(text_blob, "&amp;c&amp;", ",");
        show_debug("text_blob Value 2 ---- " + string(text_blob));
        
		text_blob = string_replace_all(text_blob, "&quot;", "\"");
        text_blob = scp_split_at_nearest_char(text_blob, 44, 6);        
        
        //Randomiz the values... 
       //scramble the choices
		/*Codes goes here*/
                
        //We actually want to nuke out play audio button - they only get to listen to it once
        ScheduleScript(id, true, 0.10, perform_event, b_swap, 0);
        b_swap = noone;
		perform_event(b_volume, 0);
		b_volume = noone;
		
        ScheduleEventUser(id, true, 0.40, 6); //spawn marshmen
        tock = true;
        tick = 0;  
        
        //Play Audio and start
        forceVoice(target_text_to_speak, "en");
        show_debug("Start Round");
		
		array_push(game_3_repeat_question_arr, round_value);
		show_debug("DUD insert round_value : "+string(round_value)+" to array game_3_repeat_question_arr");
        break;
    }
	case 4: {
        //Game Type 4 - For now its the same as Game 3
        //Clear Data
        marshmen_values = "";
        marshmen_answers = "";
        marshmen_display = "";
        inputs = 0;
        input_val = "";
        
        //Update Instructions... 
        target_text_to_speak = top_text;
        
        round_value = cur_round-1;
        

        //Get Values
       //assign the answers and distraction for the marshmen
	   /*Codes goes here*/
        
        //Get the display values 
        show_debug("Display Value ---- " + string(game4_display[round_value]));
        marshmen_display = scp_split_string(game4_display[round_value], " "); 
        var ss = array_length(marshmen_display);
        //Decode / cleanup of display values
        for(var i = 0; i < ss; i++) {
            var tt = string(marshmen_display[i]);
            if(string_count("&amp;c&amp;", tt)) {
                marshmen_display[i] = string_replace(tt, "&amp;c&amp;", ",");
            }
            
            if(string_count("&amp;val&amp;", tt)) {
                marshmen_display[i] = string_replace(tt, "&amp;val&amp;", "");
            }
			
			if(string_count("&quot;", tt)) {
                marshmen_display[i] = string_replace_all(tt, "&quot;", "\"");
            }
        }
        
        show_debug("Display Value ---- " + string(game4_display[round_value]));
        text_blob = game4_display[round_value];
        show_debug("text_blob Value ---- " + string(text_blob));
        text_blob = string_replace(text_blob, "&amp;val&amp;", lst);
        show_debug("text_blob Value 1 ---- " + string(text_blob));
        text_blob = string_replace(text_blob, "&amp;c&amp;", ",");
        show_debug("text_blob Value 2 ---- " + string(text_blob));
        
		text_blob = string_replace_all(text_blob, "&quot;", "\"");
        text_blob = scp_split_at_nearest_char(text_blob, 54, 6);        
        
         //Randomiz the values... 
       //scramble the choices
		/*Codes goes here*/
                
        //We actually want to nuke out play audio button - they only get to listen to it once
        ScheduleScript(id, true, 0.10, perform_event, b_swap, 0);
        b_swap = noone;
		perform_event(b_volume, 0);
		b_volume = noone;
		
        ScheduleEventUser(id, true, 0.40, 6); //spawn marshmen
        tock = true;
        tick = 0;  
        
        //Play Audio and start
        forceVoice(target_text_to_speak, "en");
        show_debug("Start Round");
		
		array_push(game_4_repeat_question_arr, round_value);
		show_debug("DUD insert round_value : "+string(round_value)+" to array game_4_repeat_question_arr");
        break;
    }
    case 5: {
        //Game Type 5 - Build a sentance from the provided words
                
        //Clear Data
        marshmen_values = "";
        marshmen_answers = "";
        marshmen_display = "";
        inputs = 0;
        input_val = "";
        
        //Update Instructions... 
        target_text_to_speak = top_text;
        
        round_value = cur_round-1;
      

        //Get Values
       /*Codes goes here*/ 
        
        //Set the correct answer(s)
        /*Codes goes here*/
        
        //Get the display values 
        show_debug("Display Value ---- " + string(game5_values[round_value]));
        /*Codes goes here*/
        
        //Randomiz the values... 
       /*Codes goes here*/ 
    
        //We actually want to nuke out play audio button - they only get to listen to it once
        ScheduleScript(id, true, 0.10, perform_event, b_swap, 0);
        b_swap = noone;
		perform_event(b_volume, 0);
		b_volume = noone;
        
        ScheduleEventUser(id, true, 0.40, 6); //spawn marshmen
        tock = true;
        tick = 0;  
        
        //Play Audio and start
        forceVoice(target_text_to_speak, "en");
        show_debug("Start Round");
		
		array_push(game_5_repeat_question_arr, round_value);
		show_debug("DUD insert round_value : "+string(round_value)+" to array game_5_repeat_question_arr");
        break;
    }
	case 6:{
		//Game 6 - Match each paragraph to the correct heading in the multiple-choice format.

        //Clear Data
        marshmen_values = [];
        marshmen_answers = [];
        inputs = 0;
        input_val = "";
		
		round_value = cur_round-1;
        
		
		marshmen_values = scp_split_string(game6_option[round_value], ";");
        
        //Pick one of the marshmen to be correct
		/*Codes goes here*/
        
        //We actually want to nuke out play audio button - they only get to listen to it once
        ScheduleScript(id, true, 0.10, perform_event, b_swap, 0);
        b_swap = noone;
		perform_event(b_volume, 0);
		b_volume = noone;
		
		text_game6 = game6_values[round_value];
		text_game6 = string_replace_all(text_game6, "&quot;", "\"");
		text_game6 = scp_split_at_nearest_char(string(text_game6), 65);
		
        ScheduleEventUser(id, true, 1.5, 6); //spawn marshmen
        tock = true;
        tick = 0;
        test_timer_tock = true; //false = freeze timer
		
		array_push(game_6_repeat_question_arr, round_value);
		show_debug("DUD insert round_value : "+string(round_value)+" to array game_6_repeat_question_arr");
		break;
	}
    case 7: {
        //Level Up (Next Game type)
        break;
    }
    case 8: {
        //Game Over
        break;
    }
}

