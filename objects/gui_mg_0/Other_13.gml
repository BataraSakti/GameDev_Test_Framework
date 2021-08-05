/// @description Flow 

switch(display_stage) {
    case 0: {
        //Intro / Tutorial
		show_debug("Update Mode UI 0");
        event_user(2);
        last_stage = 0;
        next_stage = 1;
        if(diff_level == 0) {
            ScheduleSetGroup(ScheduleScript(id, true, text_fade_time, display_stage__, 1), "_ds_");
        } else {
            ScheduleSetGroup(ScheduleScript(id, true, text_fade_time, display_stage__, diff_level), "_ds_");
        }
        type_1_mode = 1;
        ScheduleEventUser(id, true, text_fade_time + 0.05, 3); 
        break;
    }
    case 1: {
        //Game Type 1 - Select the Leter / Number / Word spoken.
        show_debug("Update Mode UI 1");
        switch(type_1_mode) {
            case 1: {
                //Numbers
				show_debug("DUD Game_1 mode 1");
                ds_list_clear(round_data_list);
                ds_list_copy(round_data_list, game1_numbers);
                
                perform_event(b_gui, 0);
                b_gui = noone;
                top_text = text_type_1_top_2;
                cur_round = 1;
                num_correct = 0;
                
                if(diff_level == 0) {
					f_resetDefaultSettings(1, 4, 1, true, 1, 15);
                    if(test_timer_time == 0) {
                        test_timer_time = 210;
                    }
                } else {                                
                    f_resetDefaultSettings(1, 4, 1, true, 4, 15);
                }
                                
                event_user(1); //Spawn our gui
                break;
            }
            case 2: {
                //Letters
				show_debug("DUD Game_1 mode 2");
                ds_list_clear(round_data_list);
                ds_list_copy(round_data_list, game1_numbers);
                
                perform_event(b_gui, 0);
                b_gui = noone;
                top_text = text_type_1_top_2;
                cur_round = 1;
                num_correct = 0;
                                
                if(diff_level == 0) {
					f_resetDefaultSettings(1, 4, 1, true, 1, 15);
                } else {                                
                    f_resetDefaultSettings(1, 4, 1, true, 2, 15);
                } 
                                
                event_user(1); //Spawn our gui
                break;
            }
            case 3: {
                //letters
				show_debug("DUD Game_1 mode 3");
                ds_list_clear(round_data_list);
                ds_list_copy(round_data_list, game1_letters);
                
                perform_event(b_gui, 0);
                b_gui = noone;
                top_text = text_type_1_top_1;
                cur_round = 1;
                num_correct = 0;
                                
                if(diff_level == 0) {
					f_resetDefaultSettings(1, 4, 1, true, 1, 15);
                } else {                                
                    f_resetDefaultSettings(1, 4, 1, true, 4, 15);
                }
                                
                event_user(1); //Spawn our gui
                
                break;
            }
            case 0: {
                //Next Game / End Game
                ds_list_clear(round_data_list);
                last_stage = 1;
                next_stage = 2;
                perform_event(b_gui, 0);
                b_gui = noone;
                if(diff_level == 0 && force_end == false) {
                    ScheduleScript(id, true, text_fade_time, display_stage__, 7);
                } else {
                    ScheduleScript(id, true, text_fade_time, display_stage__, 8);
                }
                type_1_mode = 1;
                type_2_mode = 1;
                ScheduleEventUser(id, true, text_fade_time + 0.05, 1); 
                break;
            }
        }
        break;
    }
    case 2: {
        //Game Type 2 - Select the words in the category.
        show_debug("Update Mode UI 2");
        switch(type_2_mode) {
            case 1: {
                show_debug("Load Type 2 mode 1");
                ds_list_clear(round_data_list);
                perform_event(b_gui, 0);
                b_gui = noone;
                top_text = "";
                target_text_to_speak = top_text;
                
                cur_round = 1;
                num_correct = 0;
                                
                if(diff_level == 0) {
					f_resetDefaultSettings(3, 7, 3, false, 1, 20);
                } else {                                
                    f_resetDefaultSettings(3, 7, 3, false, 1, 20);
                }
                
                event_user(1); //Spawn our gui
                break;
            }
            case 2: {
                show_debug("Load Type 2 mode 2");
                ds_list_clear(round_data_list);
                perform_event(b_gui, 0);
                b_gui = noone;
                top_text = "";
                target_text_to_speak = top_text;
                
                cur_round = 1;
                num_correct = 0;
                                
                if(diff_level == 0) {
					f_resetDefaultSettings(3, 7, 3, false, 1, 20);
                } else {                                
                    f_resetDefaultSettings(3, 7, 3, false, 1, 20);
                }
                
                event_user(1); //Spawn our gui
                break;
            }
    
            case 3: {
                //Next Game / End Game
                show_debug("End Type 2");
                last_stage = 2;
                next_stage = 3;
                perform_event(b_gui, 0);
                b_gui = noone;
                if(diff_level == 0 && force_end == false) {
                    ScheduleScript(id, true, text_fade_time, display_stage__, 7);
                } else {
                    ScheduleScript(id, true, text_fade_time, display_stage__, 8);
                }
                type_2_mode = 1;
                type_3_mode = 1;
                ScheduleEventUser(id, true, text_fade_time + 0.05, 1); 
                break;
            }
        }
        break;
    }
    case 3: {
        //Game Type 3 - Select the correct word to complete the sentance.
        show_debug("Update Mode UI 3");
        switch(type_3_mode) {
            case 1: {
                ds_list_clear(round_data_list);
                
                show_debug("Game_3 Load Type 3-1");
                perform_event(b_gui, 0);
                b_gui = noone;
                top_text = text_type_3_top_1;
                target_text_to_speak = top_text;
                cur_round = 1;
                num_correct = 0;
                
                if(diff_level == 0) {
					f_resetDefaultSettings(1, 7, 1, true, 1, 30);
                } else {                                
                    f_resetDefaultSettings(1, 7, 1, true, 2, 30);
                }
                
                event_user(1); //Spawn our gui
                break;
            }
			case 2: {
                ds_list_clear(round_data_list);
                
                show_debug("Game_3 Load Type 3-2");
                perform_event(b_gui, 0);
                b_gui = noone;
                top_text = text_type_3_top_1;
                target_text_to_speak = top_text;
                cur_round = 1;
                num_correct = 0;
                
                if(diff_level == 0) {
					f_resetDefaultSettings(1, 7, 1, true, 1, 30);
                } else {                                
                    f_resetDefaultSettings(1, 7, 1, true, 2, 30);
                }
                
                event_user(1); //Spawn our gui
                break;
            }
            case 3: {
                //Next Game / End Game
                show_debug("End Game 3");
                last_stage = 3;
                next_stage = 4;
                perform_event(b_gui, 0);
                b_gui = noone;
                if(diff_level == 0 && force_end == false) {
                    ScheduleScript(id, true, text_fade_time, display_stage__, 7);
                } else {
                    ScheduleScript(id, true, text_fade_time, display_stage__, 8);
                }
                type_3_mode = 1;
                type_4_mode = 1;
                ScheduleEventUser(id, true, text_fade_time + 0.05, 1); 
                break;
            }
        }
        break;
    }
	case 4: {
       //Game Type 4 - For now its the same as Game 3 (27 April 2020)
        show_debug("Update Mode UI 4");
        switch(type_4_mode) {
            case 1: {
                ds_list_clear(round_data_list);
                
                show_debug("Game_4 Load Type 4-1");
                perform_event(b_gui, 0);
                b_gui = noone;
                top_text = text_type_4_top_1;
                target_text_to_speak = top_text;
                cur_round = 1;
                num_correct = 0;
                
                if(diff_level == 0) {
					f_resetDefaultSettings(1, 7, 1, true, 1, 30);
                } else {                                
                    f_resetDefaultSettings(1, 7, 1, true, 2, 30);
                }
                
                event_user(1); //Spawn our gui
                break;
            }
			case 2: {
                ds_list_clear(round_data_list);
                
                show_debug("Game_4 Load Type 4-2");
                perform_event(b_gui, 0);
                b_gui = noone;
                top_text = text_type_4_top_1;
                target_text_to_speak = top_text;
                cur_round = 1;
                num_correct = 0;
                
                if(diff_level == 0) {
					f_resetDefaultSettings(1, 7, 1, true, 1, 30);
                } else {                                
                    f_resetDefaultSettings(1, 7, 1, true, 2, 30);
                }
                
                event_user(1); //Spawn our gui
                break;
            }
            case 3: {
                //Next Game / End Game
                show_debug("End Game 4");
                last_stage = 4;
                next_stage = 5;
                perform_event(b_gui, 0);
                b_gui = noone;
                if(diff_level == 0 && force_end == false) {
                    ScheduleScript(id, true, text_fade_time, display_stage__, 7);
                } else {
                    ScheduleScript(id, true, text_fade_time, display_stage__, 8);
                }
                type_4_mode = 1;
                type_5_mode = 1;
                ScheduleEventUser(id, true, text_fade_time + 0.05, 1); 
                break;
            }
        }
        break;
    }
    case 5: {
        //Game Type 4 - Build a sentance from the provided words
        show_debug("Update Mode UI 5");
        switch(type_5_mode) {
            case 1: {
                ds_list_clear(round_data_list);
                
                show_debug("Game_5 Load Type 5-1");
                perform_event(b_gui, 0);
                b_gui = noone;
                
                top_text = text_type_5_top_1;
                target_text_to_speak = top_text;
                cur_round = 1;
                num_correct = 0;
                
                if(diff_level == 0) {
					f_resetDefaultSettings(7, 7, 1, true, 1, 30);
                } else {                                
                    f_resetDefaultSettings(7, 7, 1, true, 2, 30);
                }
           
                event_user(1); //Spawn our gui
                break;
            }
			case 2: {
                ds_list_clear(round_data_list);
                
                show_debug("Game_5 Load Type 5-2");
                perform_event(b_gui, 0);
                b_gui = noone;
                
                top_text = text_type_5_top_1;
                target_text_to_speak = top_text;
                cur_round = 1;
                num_correct = 0;
                
                if(diff_level == 0) {
					f_resetDefaultSettings(7, 7, 1, true, 1, 30);
                } else {
                    f_resetDefaultSettings(7, 7, 1, true, 2, 30);
                }
           
                event_user(1); //Spawn our gui
                break;
            }
            case 3: {
                //Next Game / End Game
                show_debug("End Game 5");
                last_stage = 5;
                next_stage = 6;
                perform_event(b_gui, 0);
                b_gui = noone;
                if(diff_level == 0 && force_end == false) {
                    ScheduleScript(id, true, text_fade_time, display_stage__, 7);
                } else {
                    ScheduleScript(id, true, text_fade_time, display_stage__, 8);
                }
                type_5_mode = 1;
                ScheduleEventUser(id, true, text_fade_time + 0.05, 1); 
                break;
            }
        }
        break;
    }
	case 6:{
		//Game 6 - Match each paragraph to the correct heading in the multiple-choice format.
		show_debug("Update Mode UI 1");
		switch(type_6_mode) {
            case 1: {
                ds_list_clear(round_data_list);
                show_debug("Game_6 Load Type 6-1");
                perform_event(b_gui, 0);
                b_gui = noone;
                top_text = scp_split_at_nearest_char(text_type_6_top_1, 43);
                cur_round = 1;
                num_correct = 0;
                
                if(diff_level == 0) {
					f_resetDefaultSettings(1, 4, 1, true, 1, 210);
                    if(test_timer_time == 0) {
                        test_timer_time = 210;
                    }
                } else {                                
                    f_resetDefaultSettings(1, 4, 1, true, 1, 210);
                }
                                
                event_user(1); //Spawn our gui
                break;
            }
			case 2: {
                ds_list_clear(round_data_list);
                show_debug("Game_6 Load Type 6-2");
                perform_event(b_gui, 0);
                b_gui = noone;
                top_text = scp_split_at_nearest_char(text_type_6_top_1, 43);
                cur_round = 1;
                num_correct = 0;
                
                if(diff_level == 0) {
					f_resetDefaultSettings(1, 4, 1, true, 1, 210);
                    if(test_timer_time == 0) {
                        test_timer_time = 210;
                    }
                } else {                                
                    f_resetDefaultSettings(1, 4, 1, true, 1, 210);
                }
                                
                event_user(1); //Spawn our gui
                break;
			}
            case 3: {
                //Next Game / End Game
				show_debug("End Game 6");
                ds_list_clear(round_data_list);
                last_stage = 6;
                next_stage = 8;
                perform_event(b_gui, 0);
                b_gui = noone;
                if(diff_level == 0 && force_end == false) {
                    ScheduleScript(id, true, text_fade_time, display_stage__, 7);
                } else {
                    ScheduleScript(id, true, text_fade_time, display_stage__, 8);
                }
                type_6_mode = 1;
                ScheduleEventUser(id, true, text_fade_time + 0.05, 1); 
                break;
            }
        }
		break;
	}
    case 7: {
        //Level Up (Next Game type)
        event_user(2);
        ScheduleScript(id, true, text_fade_time, display_stage__, next_stage);
        ScheduleEventUser(id, true, text_fade_time + 0.05, 3); 
        //test_timer_tock = false;
        break;
    }
    case 8: {
        //Game Over		
        //Analytics_SendEvent("CompleteMG0");
        event_user(1); //Spawn our gui
        test_timer_tock = false;
        break;
    }
}

