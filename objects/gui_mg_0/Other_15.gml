/// @description Responder to user input.
show_debug("gui_mg_0 -> display_stage: " + string(display_stage));
var do_save = false;
var is_good = false;
switch(display_stage) {
    case 0: {
        //Intro / Tutorial
        break;
    }
    case 1: {
        //Game Type 1 - Select the Leter / Number / Word spoken.
        
        var mm_key = 0; //This game mode only has one correct answer...
        var vals = "";
        
        //Evaluate Ansers 
        if(test_timer_time > 0) { 
            if(ret_value == marshmen_answers[mm_key] && trial == false) {
                //Correct
                show_debug("Input Answer Correct - " + string(marshmen_answers[mm_key]));
                num_correct ++;
				isRound_correct += 1;
                if(diff_level == 0) {
                    test_cur_round = clamp(test_cur_round + 1, 1, test_total_round);
                }
				if(try_count == 1){
					try_count++; //Try count must above 1 to continue real game
				}
            }
			else if(trial == true){
				if(ret_value == marshmen_answers[mm_key]){
					try_correct++;
				}
				try_count++;
			}else {
                //Not Correct
				//test_cur_round = clamp(test_cur_round + 1, 1, test_total_round);
                show_debug(string(ret_value) + " -> Input Not Correct Should be -> " + string(marshmen_answers[mm_key]));
				isRound_correct = -1;
				if(try_count == 1){
					//Trial mark as correct although its wrong to continue real game
					num_correct++;
					if(diff_level == 0) {
	                    test_cur_round = clamp(test_cur_round + 1, 1, test_total_round);
	                }
					try_count++; //Try count must above 1 to continue real game
				}
			}
            //Player_Answer-Correct_Answer
            vals = string(ret_value)+"-"+string(marshmen_answers[mm_key]);
        } else {
            //Not Correct - Out of Time
            show_debug("Out of Time Should be -> " + string(marshmen_answers[mm_key]));
            vals = " -"+string(marshmen_answers[mm_key]);
        }
        
        //Save the players inputs for each round by game mode
        switch(type_1_mode) {
            case 1: {
                //Numbers
                if(player_type_1_mode_1 == "") {
                    player_type_1_mode_1 = vals;
                } else {
                    player_type_1_mode_1 += ","+vals;
                }
                break;
            }
            case 2: {
                //Letters
                if(player_type_1_mode_2 == "") {
                    player_type_1_mode_2 = vals;
                } else {
                    player_type_1_mode_2 += ","+vals;
                }
                break;
            }
            //case 3: {
            //    //Words
            //    if(player_type_1_mode_3 == "") {
            //        player_type_1_mode_3 = vals;
            //    } else {
            //        player_type_1_mode_3 += ","+vals;
            //    }
            //    break;
            //}
        }
        
        //Stop the timer if it is running
        tock = false;
        tick = 0;
        
        with(o_marshman) { did_once = true; } //Disable all marshmen...
        
        show_debug("Round Up");
        if(cur_round < total_round && trial == false) {
			//Next Round
	        cur_round++;
	        no_fade = true;
	        ScheduleEventUser(id, true, 0.65, 2);
	        ScheduleEventUser(id, true, 1.15, 1);
        } else {
            //End play
            no_fade = false;
            ScheduleEventUser(id, true, 0.5, 2);       
            cur_round = 1;
			
            var do_prog = true;
            if(num_correct >= 1) { 
                //We passed this time
                switch(type_1_mode) {
                    case 1: {
                        //Numbers
                        type_1_mode = 2;
                        break;
                    }
                    case 2: {
                        //Letters
                        type_1_mode = 3;
                        break;
                    }
                    case 3: {
                        //Words
                        type_1_mode = 0;
                        break;
                    }
                }
            } else {
                //We didn't pass... are we allowed to retry?
                if(player_retrys < (allowed_retrys) && trial == false) {
                    player_retrys++;
                }
				else if(trial){
					/* if want unlimited wrong answer in trial
					if(try_correct < 3){
						try_count--;
					}*/
					do_prog = true;
				}else {
                    //Well nope.. the player is done 
                    do_prog = false;
                }
            }
            
            if(do_prog == false) { 
                b_yes = createButtonTargeted(x, y + 160, elements_layer, gui_yes_text_top,id, 0, "");
                b_gui = instance_create_layer(x,y,elements_layer,gui_progress_overlay);
                with(b_marshman){can_click = 0;}
                //End now
                test_timer_tock = false;
                b_gui.dvalue = 5;
                force_end = true;
                type_1_mode = 0;
                //Hack to make the output match the questions
                if(test_cur_round == 3) {
                    show_debug("Failed A");
                    b_gui.lvalue = 0;
                } else {
                    show_debug("Failed Pre-A");
                    b_gui.lvalue = 0;
                }
            } else {
                if(diff_level == 0) {
                    no_fade = true;
                    ScheduleEventUser(id, true, 0.9, 3);
                } else {
                    b_yes = createButtonTargeted(x, y + 160, elements_layer, gui_yes_text_top,id, 3, "next");
                    b_gui = instance_create_layer(x,y,elements_layer,gui_progress_overlay);
                    
                    
                    b_gui.dvalue = num_correct;
                    if(type_1_mode == 0) { //Round 1
                        b_gui.lvalue = 0;
                    } else {
                        b_gui.lvalue = 0; //Round 2
                        if(num_correct > 1) {
                            b_gui.lsub = type_1_mode-1;
                        } else {
                            b_gui.lsub = type_1_mode-2;
                        }
                    }
                }
            }
        }
		instance_destroy_safe(b_hint);
		max_hint = 0;
		
		if(try_count > 0){
			trial = false;
			text_try = false;
		}
        break;
    }
    case 2: {
        //Game Type 2 - Select the words in the category.
        
        //We need to get # responses BEFORE we grade and continue... 
        inputs++;
        c_counter++;
        if(input_val == "") {
            input_val = string(ret_value);
        } else {
            input_val = input_val+","+string(ret_value);
        }
         
        if(inputs == inputs_needed) {
            //Build Answr Key 
            var answer_key = "";
            if(isType2Started){
               for(var i = 0; i < marshmen_answers_count; i++) {
                    if(answer_key == "") {
                        answer_key = string(marshmen_answers[i]);
                    } else {
                        answer_key = answer_key + "," +  string(marshmen_answers[i]);
                    }
                } 
            }
                        
            show_debug("Anser Key is --- " + answer_key);
            show_debug("Input Key is --- " + input_val);
            ret_value = input_val;
            var vals = "";
            
            //Evaluate Ansers 
            
            if(test_timer_time > 0 && isType2Started) {             
                var ans = scp_split_string(ret_value, ",");
                var is_good = true;
                if(ret_value == "") {
                    is_good = false;
                } else {
                    if(marshmen_order == false) {
						if(array_length_1d(ans) < marshmen_answers_count) {
							is_good = false; //Not enough answers
						} else {
	                        for(var i = 0; i < marshmen_answers_count; i++) {              
	                            if(scp_value_in_array(string(ans[i]), marshmen_answers) == false) {
	                                is_good = false;
	                            }
	                        }
						}
                    } else {
                        //Order must match keys.
						if(array_length_1d(ans) < marshmen_answers_count) {
							is_good = false; //Not enough answers
						} else {
	                        for(var i = 0; i < marshmen_answers_count; i++) {              
	                            if(string(ans[i]) != string(marshmen_answers[i])) {
	                                is_good = false;
	                            }                        
	                        }           
						}
                    }
                }
            
                if(is_good) {
                    //Correct
                    show_debug("Input Answer Correct - " + string(ret_value));
                    num_correct += 1;
					isRound_correct += 1;
					if(spec_counter > 0){
						//reset spec_counter to pass current round
						spec_counter = 0;
					}
                    if(diff_level == 0) {
                        test_cur_round = clamp(test_cur_round + 1, 1, test_total_round);
                    }
                } else {
                    //Not Correct
					//test_cur_round = clamp(test_cur_round + 1, 1, test_total_round);
                    show_debug(string(ret_value) + " -> Input Not Correct Should be -> " + string(answer_key));
					isRound_correct = -1;
				}
                //Player_Answer-Correct_Answer
                vals = string(ret_value)+"-"+string(answer_key);
            } else {
                //Not Correct - Out of Time
                show_debug("Out of Time Should be -> " + string(answer_key));
                vals = " -"+string(answer_key);
                var is_good=false;
            }
        
            //Save the players inputs for each round by game mode
            switch(type_2_mode) {
                case 1: {
                    //Hypernym
                    if(player_type_2_mode_1 == "") {
                        player_type_2_mode_1 = vals;
                    } else {
                        player_type_2_mode_1 += ","+vals;
                    }
                    break;
                }
                case 2: {
                    //Synonym
                    if(player_type_2_mode_2 == "") {
                        player_type_2_mode_2 = vals;
                    } else {
                        player_type_2_mode_2 += ","+vals;
                    }
                    break;
                }
            }
            
            //Stop the timer if it is running
            tock = false;
            tick = 0;
            
            with(o_marshman) { did_once = true; } //Disable all marshmen...
            
            show_debug("Round Up");
            var do_prog = true;
            if(is_good == false) {  //num_correct < 1) {
                show_debug("Not Correct --- do retry?");
                //We didn't pass... are we allowed to retry?
                if(player_retrys < allowed_retrys) {
                    player_retrys++; //Don't need to do anything else but increment the test total retrys.
					spec_counter++; //Add spec_counter, it is needed if the total round is only 1
                    show_debug("Not Correct --- YES retry");
                } else {
                    //Well nope.. the player is done 
                    do_prog = false;
                    show_debug("Not Correct --- NO retry");
                }
            }
            
            if(do_prog == false) { 
                //End now
                show_debug("End Rounds");
                no_fade = false;
                ScheduleEventUser(id, true, 0.5, 2);       
                cur_round = 1;
                inputs = 0;
                input_val = ""; 
                
                test_timer_tock = false;
                b_yes = createButtonTargeted(x, y + 160, elements_layer, gui_yes_text_top,id, 0, "");
                
                
                b_gui = instance_create_layer(x,y,elements_layer,gui_progress_overlay);
                b_gui.dvalue = 5;
                force_end = true;
                type_2_mode = 3;
                //Hack to make the output match the questions
                if(test_cur_round-1 < 4) { //means we passed A
                    show_debug("Failed Round 3");
                    b_gui.lvalue = 0;
                } else {
                    show_debug("Failed Round 4");
                    b_gui.lvalue = 1;
                }
            } else if(cur_round < total_round || spec_counter > 0) {
                show_debug("Next Round");
                cur_round++;
                inputs = 0;
                input_val = "";
                no_fade = true;
                ScheduleEventUser(id, true, 0.65, 2);
                ScheduleEventUser(id, true, 1.15, 1);
            } else {
                //End play
                show_debug("End Rounds");
                no_fade = false;
                ScheduleEventUser(id, true, 0.5, 2);       
                cur_round = 1;
                inputs = 0;
                input_val = ""; 
                type_2_mode += 1;
                
                if(diff_level == 0) {
                    no_fade = true;
                    ScheduleEventUser(id, true, 0.9, 3);
                } else {
                    b_yes = createButtonTargeted(x, y + 160, elements_layer, gui_yes_text_top,id, 3, "next");
                    
                    
                    b_gui = instance_create_layer(x,y,elements_layer,gui_progress_overlay);
                    b_gui.dvalue = num_correct;
                    if(type_2_mode == 1) { //Round 3
                        b_gui.lvalue = 0;
                    } if(type_2_mode == 2) { //Round 4
                        b_gui.lvalue = 1;
                        if(num_correct > 1) {
                            b_gui.lsub = 1;
                        } 
                    } else {
                        //End games..
                        b_gui.lvalue = 0;   
                    }
                }
            }
            /*
            if(diff_level == 0) {
                round_text = string(test_cur_round)+"/"+string(test_total_round);
            } else {
                round_text = string(cur_round)+"/"+string(total_round);
            }
            */
        }
        break;
    }
    case 3: {
        //Game Type 3 - Select the correct word to complete the sentance.
        
        //We need to get # responses BEFORE we grade and continue... 
        inputs++;
        if(input_val == "") {
            input_val = string(ret_value);
        } else {
            input_val = input_val+","+string(ret_value);
        }
         
        if(inputs == inputs_needed) {
            text_blob = "";
        
            //Build Answr Key 
            var answer_key = "";
            for(var i = 0; i < marshmen_answers_count; i++) {
                if(answer_key == "") {
                    answer_key = string(marshmen_answers[i]);
                } else {
                    answer_key = answer_key + "," +  string(marshmen_answers[i]);
                }
            }            
            show_debug("Anser Key is --- " + answer_key);
            show_debug("Input Key is --- " + input_val);
            ret_value = input_val;
            var vals = "";
            
            //Evaluate Ansers 
            if(test_timer_time > 0) {             
                var ans = scp_split_string(ret_value, ",");
                var is_good = true;
                if(ret_value == "") {
                    is_good = false;
                } else {
                    if(marshmen_order == false) {
                        for(var i = 0; i < marshmen_answers_count; i++) {              
                            if(scp_value_in_array(string(ans[i]), marshmen_answers) == false) {
                                is_good = false;
                            }
                        }
                    } else {
                        //Order must match keys.
                        for(var i = 0; i < marshmen_answers_count; i++) {              
                            if(string(ans[i]) != string(marshmen_answers[i])) {
                                is_good = false;
                            }                        
                        }            
                    }
                }
                
                if(is_good) {
                    //Correct
                    show_debug("Input Answer Correct - " + string(ret_value));
                    num_correct += 1;
					if(spec_counter_stage_3 > 0){
						spec_counter_stage_3 = 0;
					}
					isRound_correct += 1;
                    if(diff_level == 0) {
                        test_cur_round = clamp(test_cur_round + 1, 1, test_total_round);
                    }
                } else {
                    //Not Correct
					//test_cur_round = clamp(test_cur_round + 1, 1, test_total_round);
                    show_debug(string(ret_value) + " -> Input Not Correct Should be -> " + string(answer_key));
					isRound_correct = -1;
				}
                //Player_Answer-Correct_Answer
                vals = string(ret_value)+"-"+string(answer_key);
            } else {
                //Not Correct - Out of Time
                show_debug("Out of Time Should be -> " + string(answer_key));
                vals = " -"+string(answer_key);
            }
        
            //Save the players inputs for each round by game mode
            switch(type_3_mode) {
                case 1:
				case 2: {
                    if(player_type_3_mode_1 == "") {
                        player_type_3_mode_1 = vals;
                    } else {
                        player_type_3_mode_1 += ","+vals;
                    }
                    break;
                }
            }
            
            //Stop the timer if it is running
            tock = false;
            tick = 0;
            
            with(o_marshman) { did_once = true; } //Disable all marshmen...
            
            var do_prog = true;
			if(is_good == false) {  //num_correct < 1) {
                show_debug("Not Correct --- do retry?");
                //We didn't pass... are we allowed to retry?
                if(player_retrys < allowed_retrys) {
                    player_retrys++; //Don't need to do anything else but increment the test total retrys.
					spec_counter_stage_3++; //Add spec_counter, it is needed if the total round is only 1
                    show_debug("Not Correct --- YES retry");
                } else {
                    //Well nope.. the player is done 
                    do_prog = false;
                    show_debug("Not Correct --- NO retry");
                }
            }

           if(do_prog == false) { 
                //End now
                show_debug("End Rounds");
                no_fade = false;
                ScheduleEventUser(id, true, 0.5, 2);       
                cur_round = 1;
                inputs = 0;
                input_val = ""; 
                
                test_timer_tock = false;
                b_yes = createButtonTargeted(x, y + 160, elements_layer, gui_yes_text_top,id, 0, "");
                
                
                b_gui = instance_create_layer(x,y,elements_layer,gui_progress_overlay);
                b_gui.dvalue = 5;
                force_end = true;
                type_3_mode = 3;
                //Hack to make the output match the questions
                if(test_cur_round-1 < 6) {
                    show_debug("Failed Round 5");
                    b_gui.lvalue = 1;
                } else {
                    show_debug("Failed Round 6");
                    b_gui.lvalue = 2;
                }                
            } else if(cur_round < total_round || spec_counter_stage_3 > 0) {
                show_debug("Next Round");
                cur_round++;
                inputs = 0;
                input_val = "";
                no_fade = true;
                ScheduleEventUser(id, true, 0.65, 2);
                ScheduleEventUser(id, true, 1.15, 1);
            } else {
                //End play
                show_debug("End Rounds");
                no_fade = false;
                ScheduleEventUser(id, true, 0.5, 2);       
                cur_round = 1;
                inputs = 0;
                input_val = ""; 
                type_3_mode += 1;
                
                if(diff_level == 0) {
                    no_fade = true;
                    ScheduleEventUser(id, true, 0.9, 3);
                } else {
                    b_yes = createButtonTargeted(x, y + 160, elements_layer, gui_yes_text_top,id, 3, "next");
                    
                    
                    b_gui = instance_create_layer(x,y,elements_layer,gui_progress_overlay);
                    b_gui.dvalue = num_correct;
                    if(type_3_mode == 1) { //Round 5
                        b_gui.lvalue = 1;
                    } if(type_3_mode == 2) { //Round 6
                        b_gui.lvalue = 2;
                        if(num_correct > 1) {
                            b_gui.lsub = 1;
                        } 
                    } else {
                        //End games..
                        b_gui.lvalue = 1;   
                    }
                }
            }
        }
        break;
    }
	 case 4: {
        //Game Type 4 - For now its the same as Game 3 (27 April 2020)
        
        //We need to get # responses BEFORE we grade and continue... 
        inputs++;
        if(input_val == "") {
            input_val = string(ret_value);
        } else {
            input_val = input_val+","+string(ret_value);
        }
         
        if(inputs == inputs_needed) {
            text_blob = "";
        
            //Build Answr Key 
            var answer_key = "";
            for(var i = 0; i < marshmen_answers_count; i++) {
                if(answer_key == "") {
                    answer_key = string(marshmen_answers[i]);
                } else {
                    answer_key = answer_key + "," +  string(marshmen_answers[i]);
                }
            }            
            show_debug("Anser Key is --- " + answer_key);
            show_debug("Input Key is --- " + input_val);
            ret_value = input_val;
            var vals = "";
            
            //Evaluate Ansers 
            if(test_timer_time > 0) {             
                var ans = scp_split_string(ret_value, ",");
                var is_good = true;
                if(ret_value == "") {
                    is_good = false;
                } else {
                    if(marshmen_order == false) {
                        for(var i = 0; i < marshmen_answers_count; i++) {              
                            if(scp_value_in_array(string(ans[i]), marshmen_answers) == false) {
                                is_good = false;
                            }
                        }
                    } else {
                        //Order must match keys.
                        for(var i = 0; i < marshmen_answers_count; i++) {              
                            if(string(ans[i]) != string(marshmen_answers[i])) {
                                is_good = false;
                            }                        
                        }            
                    }
                }
                
                if(is_good) {
                    //Correct
                    show_debug("Input Answer Correct - " + string(ret_value));
                    num_correct += 1;
					if(spec_counter_stage_4 > 0){
						spec_counter_stage_4 = 0;
					}
					isRound_correct += 1;
                    if(diff_level == 0) {
                        test_cur_round = clamp(test_cur_round + 1, 1, test_total_round);
                    }
                } else {
                    //Not Correct
					//test_cur_round = clamp(test_cur_round + 1, 1, test_total_round);
                    show_debug(string(ret_value) + " -> Input Not Correct Should be -> " + string(answer_key));
					isRound_correct = -1;
				}
                //Player_Answer-Correct_Answer
                vals = string(ret_value)+"-"+string(answer_key);
            } else {
                //Not Correct - Out of Time
                show_debug("Out of Time Should be -> " + string(answer_key));
                vals = " -"+string(answer_key);
            }
        
            //Save the players inputs for each round by game mode
            switch(type_4_mode) {
                case 1:
				case 2: {
                    if(player_type_4_mode_1 == "") {
                        player_type_4_mode_1 = vals;
                    } else {
                        player_type_4_mode_1 += ","+vals;
                    }
                    break;
                }
            }
            
            //Stop the timer if it is running
            tock = false;
            tick = 0;
            
            with(o_marshman) { did_once = true; } //Disable all marshmen...
            
            var do_prog = true;
			if(is_good == false) {  //num_correct < 1) {
                show_debug("Not Correct --- do retry?");
                //We didn't pass... are we allowed to retry?
                if(player_retrys < allowed_retrys) {
                    player_retrys++; //Don't need to do anything else but increment the test total retrys.
					spec_counter_stage_4++; //Add spec_counter, it is needed if the total round is only 1
                    show_debug("Not Correct --- YES retry");
                } else {
                    //Well nope.. the player is done 
                    do_prog = false;
                    show_debug("Not Correct --- NO retry");
                }
            }

           if(do_prog == false) { 
                //End now
                show_debug("End Rounds");
                no_fade = false;
                ScheduleEventUser(id, true, 0.5, 2);       
                cur_round = 1;
                inputs = 0;
                input_val = ""; 
                
                test_timer_tock = false;
                b_yes = createButtonTargeted(x, y + 160, elements_layer, gui_yes_text_top,id, 0, "");
                
                
                b_gui = instance_create_layer(x,y,elements_layer,gui_progress_overlay);
                b_gui.dvalue = 5;
                force_end = true;
                type_4_mode = 3;
                //Hack to make the output match the questions
                if(test_cur_round-1 < 8) {
                    show_debug("Failed Round 7");
                    b_gui.lvalue = 2;
                } else {
                    show_debug("Failed Round 8");
                    b_gui.lvalue = 3;
                }                
            } else if(cur_round < total_round || spec_counter_stage_4 > 0) {
                show_debug("Next Round");
                cur_round++;
                inputs = 0;
                input_val = "";
                no_fade = true;
                ScheduleEventUser(id, true, 0.65, 2);
                ScheduleEventUser(id, true, 1.15, 1);
            } else {
                //End play
                show_debug("End Rounds");
                no_fade = false;
                ScheduleEventUser(id, true, 0.5, 2);       
                cur_round = 1;
                inputs = 0;
                input_val = ""; 
                type_4_mode += 1;
                
                if(diff_level == 0) {
                    no_fade = true;
                    ScheduleEventUser(id, true, 0.9, 3);
                } else {
                    b_yes = createButtonTargeted(x, y + 160, elements_layer, gui_yes_text_top,id, 3, "next");
                    
                    
                    b_gui = instance_create_layer(x,y,elements_layer,gui_progress_overlay);
                    b_gui.dvalue = num_correct;
                    if(type_4_mode == 1) { //Round 7
                        b_gui.lvalue = 2;
                    } if(type_4_mode == 2) { //Round 8
                        b_gui.lvalue = 3;
                        if(num_correct > 1) {
                            b_gui.lsub = 1;
                        } 
                    } else {
                        //End games..
                        b_gui.lvalue = 3;   
                    }
                }
            }
        }
        break;
    }
    case 5: {
        //Game Type 5 - Build a sentance from the provided words
        //We need to get # responses BEFORE we grade and continue... 
        
        dis_o = noone;
        
        with(o_marshman) { 
            if(display_only == true && display_index == other.inputs) {
                show_debug("Found Display Index --- " + string(display_index));
                other.dis_o = id;
            }
        }
        
        if(ret_man != noone) {
            ret_man.display_index = inputs;
            ret_man.text = "";
            ret_man.display_only = true;
            ret_man.sprite_index = spr_marshman_outline;
            ret_man.image_xscale = 0.35;
            ret_man.image_yscale = 0.35;
            ret_man.p_xscale_start = 0.35;
            ret_man.p_yscale_start = 0.35;
        }
        
        if(dis_o != noone) {
            dis_o.text = ret_value;
            dis_o.sprite_index = spr_marshman;
            dis_o.image_xscale = 0.65;
            dis_o.image_yscale = 0.65;
            dis_o.p_xscale_start = 0.65;
            dis_o.p_yscale_start = 0.65;
            dis_o.y -= 15;
        }
        
        inputs++;
        if(input_val == "") {
            input_val = string(ret_value);
        } else {
            input_val = input_val+" "+string(ret_value);
        }
         
        if(inputs == inputs_needed) {
            //Build Answr Key 
            var answer_key = "";
            for(var i = 0; i < marshmen_answers_count; i++) {
                if(answer_key == "") {
                    answer_key = string(marshmen_answers[i]);
                } else {
                    answer_key = answer_key + "," +  string(marshmen_answers[i]);
                }
            }            
            show_debug("Anser Key is --- " + answer_key);
            show_debug("Input Key is --- " + input_val);
            ret_value = input_val;
            var vals = "";
            
            //Evaluate Ansers 
            if(test_timer_time > 0) {             
                var ans = ""; ans[0] = ret_value; //scp_split_string(ret_value, ",");
                var is_good = true;
                if(marshmen_order == false) {
                    for(var i = 0; i < marshmen_answers_count; i++) {              
                        if(scp_value_in_array(string(ans[i]), marshmen_answers) == false) {
                            is_good = false;
                        }
                    }
                } else {
                    //Order must match keys.
                    for(var i = 0; i < marshmen_answers_count; i++) {              
                        if(string(ans[i]) != string(marshmen_answers[i])) {
                            is_good = false;
                            show_debug("NO MATCH Anser Key is --- " + string(ans[i]));
                            show_debug("NO MATCH Input Key is --- " + string(marshmen_answers[i]));
                        }
                    }            
                }
            
                if(is_good) {
                    //Correct
                    show_debug("Input Answer Correct - " + string(ret_value));
                    if(diff_level == 0) {
                        test_cur_round = clamp(test_cur_round + 1, 1, test_total_round);
                    }
					if(spec_counter_stage_5 > 0){
						spec_counter_stage_5 = 0;
					}
                    num_correct += 1;
					isRound_correct += 1;
                    if(diff_level == 0) {
                        //test_cur_round++;
                    }
                } else {
                    //Not Correct
					//test_cur_round = clamp(test_cur_round + 1, 1, test_total_round);
                    show_debug(string(ret_value) + " -> Input Not Correct Should be -> " + string(answer_key));
					isRound_correct = -1;
				}
                //Player_Answer-Correct_Answer
                vals = string(ret_value)+"-"+string(answer_key);
            } else {
                //Not Correct - Out of Time
                show_debug("Out of Time Should be -> " + string(answer_key));
                vals = " -"+string(answer_key);
            }
        
            //Save the players inputs for each round by game mode
            switch(type_5_mode) {
                case 1:
				case 2:{
                    if(player_type_5_mode_1 == "") {
                        player_type_5_mode_1 = vals;
                    } else {
                        player_type_5_mode_1 += ","+vals;
                    }
                    break;
                }
            }
            
            //Stop the timer if it is running
            tock = false;
            tick = 0;
            
            with(o_marshman) { did_once = true; } //Disable all marshmen...
            
            var do_prog = true;
			if(is_good == false) {  //num_correct < 1) {
                show_debug("Not Correct --- do retry?");
                //We didn't pass... are we allowed to retry?
                if(player_retrys < allowed_retrys) {
                    player_retrys++; //Don't need to do anything else but increment the test total retrys.
					spec_counter_stage_5++; //Add spec_counter, it is needed if the total round is only 1
                    show_debug("Not Correct --- YES retry");
                } else {
                    //Well nope.. the player is done 
                    do_prog = false;
                    show_debug("Not Correct --- NO retry");
                }
            }

           if(do_prog == false) { 
                //End now
                show_debug("End Rounds");
                no_fade = false;
                ScheduleEventUser(id, true, 0.5, 2);       
                cur_round = 1;
                inputs = 0;
                input_val = ""; 
                
                test_timer_tock = false;
                b_yes = createButtonTargeted(x, y + 160, elements_layer, gui_yes_text_top,id, 0, "");
                
                
                b_gui = instance_create_layer(x,y,elements_layer,gui_progress_overlay);
                b_gui.dvalue = 5;
                force_end = true;
                type_5_mode = 3;
                //Hack to make the output match the questions
                if(test_cur_round-1 < 10) {
                    show_debug("Failed Round 9");
                    b_gui.lvalue = 3;
                } else {
                    show_debug("Failed Round 10");
                    b_gui.lvalue = 4;
                }                
            } else if(cur_round < total_round || spec_counter_stage_5 > 0) {
                show_debug("Next Round");
                cur_round++;
                inputs = 0;
                input_val = "";
                no_fade = true;
                ScheduleEventUser(id, true, 0.65, 2);
                ScheduleEventUser(id, true, 1.15, 1);
            } else {
                //End play
                show_debug("End Rounds");
                no_fade = false;
                ScheduleEventUser(id, true, 0.5, 2);       
                cur_round = 1;
                inputs = 0;
                input_val = ""; 
                type_5_mode += 1;
                
                if(diff_level == 0) {
                    no_fade = true;
                    ScheduleEventUser(id, true, 0.9, 3);
                } else {
                    b_yes = createButtonTargeted(x, y + 160, elements_layer, gui_yes_text_top,id, 3, "next");
                    
                    
                    b_gui = instance_create_layer(x,y,elements_layer,gui_progress_overlay);
                    b_gui.dvalue = num_correct;
                    if(type_5_mode == 1) { //Round 9
                        b_gui.lvalue = 3;
                    } if(type_5_mode == 2) { //Round 10
                        b_gui.lvalue = 4;
                        if(num_correct > 1) {
                            b_gui.lsub = 1;
                        } 
                    } else {
                        //End games..
                        b_gui.lvalue = 4;   
                    }
                }
            }
        }
        break;
    }
	case 6:{
		//Game 6 - Match each paragraph to the correct heading in the multiple-choice format.
		var mm_key = 0; //This game mode only has one correct answer...
        var vals = "";
        
        //Evaluate Ansers 
        if(test_timer_time > 0) { 
            if(ret_value == marshmen_answers[mm_key]) {
                //Correct
                show_debug("Input Answer Correct - " + string(marshmen_answers[mm_key]));
                num_correct ++;
				isRound_correct += 1;
                if(diff_level == 0) {
                    test_cur_round = clamp(test_cur_round + 1, 1, test_total_round+1); //increase the round (12/13, so on)
                }
			} else {
                //Not Correct
				//test_cur_round = clamp(test_cur_round + 1, 1, test_total_round);
                show_debug(string(ret_value) + " -> Input Not Correct Should be -> " + string(marshmen_answers[mm_key]));
				isRound_correct = -1;
			}
            //Player_Answer-Correct_Answer
            vals = string(ret_value)+"-"+string(marshmen_answers[mm_key]);
        } else {
            //Not Correct - Out of Time
            show_debug("Out of Time Should be -> " + string(marshmen_answers[mm_key]));
            vals = " -"+string(marshmen_answers[mm_key]);
        }
        
        //Save the players inputs for each round by game mode
        if(player_type_6_mode_1 == "") {
            player_type_6_mode_1 = vals;
        } else {
            player_type_6_mode_1 += ","+vals;
        }
        
        //Stop the timer if it is running
        tock = false;
        tick = 0;
        
        with(o_marshman) { did_once = true; } //Disable all marshmen...
        
        show_debug("Round Up");
        if(cur_round < total_round) {
			//Next Round
	        cur_round++;
	        no_fade = true;
	        ScheduleEventUser(id, true, 0.65, 2); //clear/despawn UI
	        ScheduleEventUser(id, true, 1.15, 1);
        } else {
            //End play
            no_fade = false;
            ScheduleEventUser(id, true, 0.5, 2); //clear/despawn UI  
            cur_round = 1;
            
            var do_prog = true;
            if(num_correct >= 1) { 
                //We passed this time
                switch(type_6_mode) {
                    case 1: {
                        //Numbers
                        type_6_mode = 2;
                        break;
                    }
                    case 2: {
                        //Letters
                        type_6_mode = 3;
                        break;
                    }
                }
            } else {
                //We didn't pass... are we allowed to retry?
                if(player_retrys < (allowed_retrys)) {
                    player_retrys++;
				}else {
                    //Well nope.. the player is done 
                    do_prog = false;
                }
            }
            
            if(do_prog == false) { 
                b_yes = createButtonTargeted(x, y + 160, elements_layer, gui_yes_text_top,id, 0, "");
                b_gui = instance_create_layer(x,y,elements_layer,gui_progress_overlay);
                with(b_marshman){can_click = 0;}
                //End now
                test_timer_tock = false;
                b_gui.dvalue = 6;
                force_end = true;
                type_6_mode = 0;
                //Hack to make the output match the questions
				b_gui.lvalue = 4; //Round 11 / Round 12
            } else {
                if(diff_level == 0) {
					no_fade = true;
                    ScheduleEventUser(id, true, 0.9, 3);
                    do_save = true;
                } else {
                    b_yes = createButtonTargeted(x, y + 160, elements_layer, gui_yes_text_top,id, 3, "next");
                    b_gui = instance_create_layer(x,y,elements_layer,gui_progress_overlay);
                    
                    
                    b_gui.dvalue = clamp(round(num_correct/4), 0, 4);
                    b_gui.lvalue = 5; //Round all finished
                }
            }
        }
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

dis_o = noone;
ret_man = noone;
ret_value = "";
show_debug("gui_mg_0-> force_end: " + string(force_end) + " do_save: " + string(do_save));

	
	


/*
Scoring hacked to match this... 
L0 - Failed to pass 1 and 2.    Star 1 - Player value = 1
L1 - 1 , 2                      Star 2 - Player value = 2
L2 - 3 , 4 , 5                  Star 3 - Player value = 3
L3 - 6 , 7 , 8, 9               Star 4 - Player value = 4
L4 - 10 , 11                    Star 5 - Player value = 5
*/
