///@description function and variable definitions


/*======== variables definitions ==========*/
game_data = undefined;
game_type_data = undefined;
timer = 210;
ui_state = 0;

//object layer
elements_layer = layer_exists_create(my_depth() - 2);
marsh_lay_top = layer_exists_create(my_depth()-2);
marsh_lay_bot = layer_exists_create(my_depth()-3);

b_yes = undefined;
htp_text = "How to play";
isDataLoaded = false;
isSampleRound = true;

//sprite
//Load the parts
backer = sprite_add("bg_mg0_candyland.png",1, false, false, 512, 512);
shelf =  sprite_add("bg_mg0_candypath.png",1, false, false, 512, 128);
tut1 =  sprite_add("gui_mg0_step1_box.png",1, false, false, 512, 128);
tut2 =  sprite_add("gui_mg0_step2_box.png",1, false, false, 512, 128);

//Buttons
b_hint = noone;
b_swap = noone;
b_volume = noone;
b_gui = noone;

//Text
instruction_text = "";
danswer = "";
player_answer = "";
marsman_answer = "";
text_blob = "";
text_solve = "Solve this sentence";
text_game6 = "";

max_wrong = 2;
max_hint = 0;
current_wrong = 0;
display_stage = 0;

round_number = 1; //start from -1 for 2 sample round before the 1st round
total_round = 12;
current_game_type = 1;



marsmans = [];
shadow_marshmans = [];

/*========= end of variables definition =========*/

/*====== Utilities Function ======*/

function get_game_data(_data_struct, _data_path){
	var _data = _data_struct;
	_data_path = scp_split_string(_data_path, ".");
	
	for (var i = 0; i < array_length(_data_path); i++){
		_data = variable_struct_get(_data, _data_path[i]);
	}
	
	return _data;
}

function destroy_current_ui_objects(){
	with (b_yes){event_user(0);}
	with (b_swap){event_user(0);}
	with (b_volume){event_user(0);}
	with(o_marshman){event_user(0);}
	with(b_hint){event_user(0);}
	with(b_gui){event_user(0);}
	marsmans = [];
	player_answer = "";
	shadow_marshmans = [];
}

function goto_ui_state(_state_number){
	destroy_current_ui_objects();
	ui_state = _state_number;
	alarm[1] = room_speed * 0.5;
}

function start_timer(){
	alarm[0] = room_speed * 1;
}

function stop_timer(){
	alarm[0] = -1;
}

function finish_gameplay(){
	destroy_current_ui_objects();
	b_yes = createButtonTargeted(x, y + 160, elements_layer, gui_yes_text_top,id, 1, "");
	b_yes.action_id = 4;
    b_gui = instance_create_layer(x,y,elements_layer,gui_progress_overlay);
	var _score = round(round_number/2.4);
	b_gui.dvalue = _score;
    b_gui.lvalue = _score;
}

function get_game_type(_round_number){
	if (_round_number < 1){
		return 1; 
	} else {
		return ceil(_round_number/2); //since each game type have 2 rounds
	}
}

function get_instruction_text(_round_number){
	var _game_type = get_game_type(_round_number);
	switch(_game_type){
		case 1:{
			if (_round_number <= 1){
				return "Listen and then select the correct letter.";
			} else {
				return "Listen and then select the correct number.";
			}
			break;
		}
		case 2:{
			return "Pick the three words."; break;
		}
		case 3:
		case 4:{
			return "Pick the missing word to complete the sentence."; break;
		}
		case 5:{
			return "Arrange the words into a perfect sentence."; break;
		}
		case 6:{
			return "Match each paragraph to the correct heading in the multiple-choice format.";
		}
	}
}

function assign_game_type1_data(_array_marshman){
	b_hint = createButtonTargeted(x, y - 105, elements_layer, btn_icon_center, id, 1, "", "" ,"", spr_btn_repeat_speak, 0.8);
	b_hint.icon = noone;
	b_hint.p_xscale_dest = 0.8;
	b_hint.action_id = 2;
	
	var _string = get_game_data(game_data, "Game_1.R"+string(getCurrentRound())+".String");
	_string = scp_array_to_list(scp_split_string(_string, ","));
	ds_list_shuffle(_string);
	
	var _marsman_count = array_length(_array_marshman);
	danswer = ds_list_find_value(_string, irandom(_marsman_count-1));
	forceVoice(danswer, "en");
	
	for (var i = 0; i < _marsman_count; i++){
		with(_array_marshman[i]){
			var _val = ds_list_find_value(_string, i);
			text = string(_val);
            dvalue = _val;
			danswer = other.danswer;
			if(other.isSampleRound()){
				if(dvalue == other.danswer){
					draw_hand = true;
				}
			}
			action_id = 3;
		}
	}
	ds_list_destroy(_string);
}

function assign_game_type2_data(_array_marshman){
	if (is_invalid(game_type_data)){
		game_type_data = get_game_data(game_data, "Game_2");
	}
	
	var _data_length = array_length(variable_struct_get_names(game_type_data));
	
	var _round_data = undefined;
	while(is_invalid(_round_data)){
		var _R_index = irandom_range(1, _data_length);
		_round_data = get_game_data(game_data, "Game_2.R"+string(_R_index));
	}
	var _cat = _round_data.Cat;
	
	instruction_text = "Pick the three "+string(_cat)+" words."
	forceVoice(instruction_text, "en");
	
	danswer = _round_data.String;
	var _values = _round_data.Values + ","+ danswer;
	_values = scp_array_to_list(scp_split_string(_values, ","));
	
	var _removed = 0; var i = 0; var _marshman_count = array_length(_array_marshman);
	var _need_remove = ds_list_size(_values) - _marshman_count;
	while (_removed < _need_remove && i < ds_list_size(_values)){
		var _val = ds_list_find_value(_values, i)
		if (string_pos(_val, danswer) == 0){
			ds_list_delete(_values, i);
			_removed++;
		} else {
			i++;
		}
	}
	
	for (var i = 0; i < _marshman_count; i++){
		with(_array_marshman[i]){
			var _val = ds_list_find_value(_values, i);
			text = string(_val);
            dvalue = _val;
			if (string_pos(dvalue, other.danswer) > 0){
				danswer = dvalue;
			}
			action_id = 3;
		}
	}
	ds_list_destroy(_values);
	variable_struct_remove(game_type_data, "R"+string(_R_index)); //removed so it won't choosen again
	
}

function assign_game_type3_4_data(_array_marshman){
	if (is_invalid(game_type_data)){
		game_type_data = get_game_data(game_data, "Game_"+string(current_game_type));
	}
	
	var _data_length = array_length(variable_struct_get_names(game_type_data));
	
	forceVoice(instruction_text, "en");
	
	var _round_data = undefined;
	while(is_invalid(_round_data)){
		var _R_index = irandom_range(1, _data_length);
		_round_data = get_game_data(game_data, "Game_"+string(current_game_type)+".R"+string(_R_index));
	}
	
	danswer = _round_data.Answer;
	text_blob = _round_data.String;
	text_blob = string_replace(text_blob, "&amp;val&amp;", "---");
	text_blob = scp_split_at_nearest_char(text_blob, 54, 6);
	
	var _values = scp_split_string(_round_data.Values, ",");
	_values = scp_array_to_list(_values);
	ds_list_shuffle(_values);
	
	for (var i = 0; i < array_length(_array_marshman); i++){
		with(_array_marshman[i]){
			var _val = ds_list_find_value(_values, i);
			text = string(_val);
            dvalue = _val;
			if (string_pos(dvalue, other.danswer) > 0){
				danswer = dvalue;
			}
			action_id = 3;
		}
	}
	ds_list_destroy(_values);
	variable_struct_remove(game_type_data, "R"+string(_R_index)); //removed so it won't choosen again
}

function assign_game_type5_data(_array_marshman){
	if (is_invalid(game_type_data)){
		game_type_data = get_game_data(game_data, "Game_"+string(current_game_type));
	}
	
	var _data_length = array_length(variable_struct_get_names(game_type_data));
	
	forceVoice(instruction_text, "en");
	
	var _round_data = undefined;
	while(is_invalid(_round_data)){
		var _R_index = irandom_range(1, _data_length);
		_round_data = get_game_data(game_data, "Game_"+string(current_game_type)+".R"+string(_R_index));
	}
	
	danswer = _round_data.Answer;
	var _values = scp_split_string(_round_data.String, ",");
	_values = scp_array_to_list(_values);
	
	ds_list_shuffle(_values);
	
	for (var i = 0; i < array_length(_array_marshman); i++){
		with (_array_marshman[i]){
			var _val = ds_list_find_value(_values, i);
			text = string(_val);
            dvalue = _val;
			danswer = _val;
			action_id = 3;
			show_ring_on_press = false;
		}
	}
	
	 //Display line
        var dis_y = y + 160;
        var st_x = x - 425;                
        var nn = array_length(_array_marshman);
        var sp_x = clamp(scp_safe_divide(850,nn-1),120,240);
        
        for(var i = 0; i < nn; i++) {
			shadow_marshmans[i] = createButtonTargeted(st_x + (i*sp_x), dis_y, elements_layer, o_marshman, id, noone);
			with (shadow_marshmans[i]){
				text = "";//string(marshmen_display[i]);
		        dvalue = "";
		        display_only = true;
		        can_return = true;
		        f_c = c_dkgray;
		        b_c = c_ltgray;
		        fn_sz = 0.9;
		        image_xscale = 0.50;
		        image_yscale = 0.50;
		        p_xscale_start = 0.50;
		        p_yscale_start = 0.50;
				sprite_index = spr_marshman_outline;
		        display_index = i;
			}
		}
		ds_list_destroy(_values);
		variable_struct_remove(game_type_data, "R"+string(_R_index)); //removed so it won't choosen again
}

function assign_game_type6_data(_array_marshman){
	if (is_invalid(game_type_data)){
		game_type_data = get_game_data(game_data, "Game_"+string(current_game_type));
	}
	
	var _data_length = array_length(variable_struct_get_names(game_type_data));
	
	forceVoice(instruction_text, "en");
	
	var _round_data = undefined;
	while(is_invalid(_round_data)){
		var _R_index = irandom_range(1, _data_length);
		_round_data = get_game_data(game_data, "Game_"+string(current_game_type)+".R"+string(_R_index));
	}
	
	danswer = _round_data.Answer;
	text_game6 = _round_data.Passage;
	text_game6 = string_replace_all(text_game6, "&quot;", "\"");
	text_game6 = scp_split_at_nearest_char(string(text_game6), 65);
	
	var _values = ds_list_create();
	ds_list_add(_values, _round_data.A);
	ds_list_add(_values, _round_data.B);
	ds_list_add(_values, _round_data.C);
	ds_list_add(_values, _round_data.D);
	ds_list_shuffle(_values);
	
	for (var i = 0; i < array_length(_array_marshman); i++){
		with (_array_marshman[i]){
			text = scp_split_at_nearest_char(ds_list_find_value(_values, i));
            dvalue = ds_list_find_value(_values, i);
            if(dvalue == other.danswer) {
               danswer = dvalue;
            }
			sprite_index = spr_rect_colors_bottom_shading;
			sprite = sprite_index;
			marshman_index = 2;
			text_yoff = 0;
			_nine_slice = true;
			fn_halign = fa_left;
			b_c = c_white;
			f_c = c_white;
			px = 0;
			fn_sz = 1.5;
			text_xoff = -180;
			txt_width = 250;
			action_id = 3;
		}
	}
}

function isSampleRound(){
	return round_number < 1? true : false;
}

function getCurrentRound(){
	return clamp(round_number,1,total_round);
}


function isTimerRunning(){
	return alarm_get(0) > 0;
}

function marshman_single_answer_responder(){
	player_answer = marsman_answer; //get it from pressed marsman
	if (timer > 0){
		if (player_answer == danswer){
			//correct
			round_number++;
	
			//game instruction
			goto_ui_state(1);
			
		} else {
			if (!isSampleRound()){
				current_wrong++;
			}
			
			if (current_wrong >= max_wrong){
				finish_gameplay();
			} else {
				//next attempt
				goto_ui_state(1);
			}
		}
	} else {
		finish_gameplay();
	}
}

function game5_move_marshman(){
	for (var i = 0; i < array_length(marsmans); i++){
		if (marsmans[i].text == string(marsman_answer)){
			with(marsmans[i]){
		        text = "";
	            display_only = true;
	            sprite_index = spr_marshman_outline;
	            image_xscale = 0.35;
	            image_yscale = 0.35;
	            p_xscale_start = 0.35;
	            p_yscale_start = 0.35;
			}
			break;
		}
	}
	
	for (var i = 0; i < array_length(shadow_marshmans); i++){
		if (shadow_marshmans[i].text == ""){
			with (shadow_marshmans[i]){
				text = other.marsman_answer;
	            sprite_index = spr_marshman;
	            image_xscale = 0.65;
	            image_yscale = 0.65;
	            p_xscale_start = 0.65;
	            p_yscale_start = 0.65;   
			}
			
			break;
		}
	}
}

function is_multiple_answer_correct(){
	if(current_game_type == 2){
		var _player_answer = scp_array_to_list(scp_split_string(player_answer, ","));
		var _danswer = scp_array_to_list(scp_split_string(danswer, ","));
		
		var _is_correct = true;
		
		for (var i = 0; i < ds_list_size(_player_answer); i++){
			var _answer = ds_list_find_value(_player_answer, i);
			if (ds_list_find_index(_danswer, _answer) == -1){
				_is_correct = false;
				break;
			}
		}
		
		return _is_correct;
		
	} else if (current_game_type == 5){
		return player_answer == danswer;
	}
}

function marshman_multiple_answer_responder(){
	var _check_answer = false;
	if (player_answer == ""){
		player_answer = marsman_answer;
	} else {
		if (current_game_type == 2){
			player_answer += "," + marsman_answer;
			if (string_count(",", player_answer) == 2){
				_check_answer = true;
			}
		} else if (current_game_type == 5) {
			player_answer += " " + marsman_answer;
			
			if (string_length(player_answer) == string_length(danswer)){
				_check_answer = true;
			}
		}
	}
	
	if (current_game_type == 5){
		game5_move_marshman();
	}
	
	if (timer > 0){
		if (_check_answer){
			if (is_multiple_answer_correct()){
				//correct
				round_number++;
	
				//game instruction
				goto_ui_state(1);
			} else {
				current_wrong++;
				if (current_wrong >= max_wrong){
					finish_gameplay();
				} else {
					//next attempt
					goto_ui_state(1);
				}
				
			}
		}
	} else {
		finish_gameplay();
	}
}

/*====== End of Utilites Function ====*/


/*========= Main Functions ============*/

function load_game_data(_file_name){
	game_data = json_parse(scp_read_json_file_to_string(_file_name));
	if (is_struct(game_data)){
		isDataLoaded = true;
	}
	
}

function create_marshmellows(_round_number){
	var _marsman = [];
	var _game_type = get_game_type(_round_number); 
	var _cur_round = getCurrentRound();
	var _meta_type = _cur_round mod 2 == 0 ? 2 : 1; 
	var marshmen_count = get_game_data(game_data, "C.Meta_"+string(_game_type)+"_"+string(_meta_type)+".MCount")
	
    var per_level = marshmen_count div 2; 
    var ext = marshmen_count % 2;
        
    var top = y+52;
    var bot = y+122;
	if (_game_type == 1){
		top = bot;
	}
	    
    var st_x = x - 100;
    var sp_x = 200;
	
	if (_game_type == 2){
		st_x = x - 405;
        sp_x = 265;
	} else if (_game_type == 3 || _game_type == 4){
		var mof = 115;
        var mdst = 305;
		
		top = y-100;
        bot = y-12;
		
		st_x = x - 405 + mof;
        sp_x = mdst;
	} else if (_game_type == 5){
		var mof = 50;
        var mdst = 270;
		
		top = y-100;
        bot = y-12;
        
        st_x = x - 405 + mof;
        sp_x = mdst;
	} else if (_game_type == 6){
		top = y+132;
	    bot = y+232;
        
	    st_x = x - 255;
	    sp_x = 510;
	}
        
	for(var i = 0; i < per_level + ext; i++) {
        array_push(_marsman, createButtonTargeted(st_x + (i*sp_x), top, marsh_lay_top, o_marshman, id, 1));
    }
		
    st_x = x - 300;
    sp_x = 600;
	
	if (_game_type == 2){
		 st_x = x - 270;
         sp_x = 265;
	} else if (_game_type == 3 || _game_type == 4){
		st_x = x - 260 + mof;
		sp_x = mdst;
	} else if (_game_type == 5){
		st_x = x - 260 + mof;
		sp_x = mdst;
	} else if (_game_type == 6){
		st_x = x - 255;
        sp_x = 510;
	}
	
	
	for(var i = 0; i < per_level; i++) {
        array_push(_marsman, createButtonTargeted(st_x + (i*sp_x), bot, marsh_lay_bot, o_marshman, id, 1));
	}
	
	return _marsman;
}

function assign_marshmellows_data(_array_marshman, _round_number){
	var _game_type = get_game_type(_round_number);
	
	switch(_game_type){
		case 1:{assign_game_type1_data(_array_marshman);break;}
		case 2:{assign_game_type2_data(_array_marshman);break;}
		case 3:
		case 4:{assign_game_type3_4_data(_array_marshman);break;}
		case 5:{assign_game_type5_data(_array_marshman);break;}
		case 6:{assign_game_type6_data(_array_marshman);break;}
	}
}

//open the object
event_user(0);
