///@description declaration and initiation
scp_declare_mg0_variable();


te_y = 0;

b_hint = noone;
max_hint = 0;

trial = true;
try_count = 0;
text_try = true;
try_correct = 0;

spec_counter = 0; //special counter, needed for stage that only has 1 total_round
spec_counter_stage_3 = 0; //special counter only for stage 3
spec_counter_stage_4 = 0; //special counter only for stage 4
spec_counter_stage_5 = 0; //special counter only for stage 5

//array to hold question id to prevent repeatance
game_1_repeat_question_arr = [];
game_3_repeat_question_arr = [];
game_4_repeat_question_arr = [];
game_5_repeat_question_arr = [];
game_6_repeat_question_arr = [];

//Delta Clock
mg0_final_granular = "";
tick = 0;
tock = false;
lastEval = 0;
//Load the parts
backer = sprite_add("bg_mg0_candyland.png",1, false, false, 512, 512);
shelf =  sprite_add("bg_mg0_candypath.png",1, false, false, 512, 128);
tut1 =  sprite_add("gui_mg0_step1_box.png",1, false, false, 512, 128);
tut2 =  sprite_add("gui_mg0_step2_box.png",1, false, false, 512, 128);

mg_index = 0;
diff_level = 0;

_score = 0;
not_started = 1;

closed = true;
closed_x = x;
open_x = 640;
open_time = 0.67;
update_time = open_time-0.10;
text_fade_time = open_time/2;
image_alpha_2 = 0; 
image_alpha_3 = 0;
control_y = -264;
control_x = 454;

b_yes = noone;
b_marshman = noone;
b_swap = noone;
b_gui = noone;
b_volume = noone;
frame = undefined;

b_c = c_black;
f_c = c_white;
c_ltg = c_ltgray;
c_b = c_black;
c_c = c_white;


no_fade = false; //if true skips the fade between ui dismiss and control - resets itself.

//Game vars
type_1_mode = 1; //1 Numbers, 2 Letters, 3 Words
type_2_mode = 1; //1 Hypernym, 2 Synonym
type_3_mode = 1; //1 Play, 2 Review
type_4_mode = 1; //1 Play, 2 Review
type_5_mode = 1; //1 Play, 2 Review
type_6_mode = 1; //1 Play, 2 Review

text_type_1_top_1 = "Listen and then select the correct number.";
text_type_1_top_2 = "Listen and then select the correct letter.";
text_type_1_top_3 = "Listen and then select the correct word.";
text_type_2_top_1 = "Pick the three &&CAT_NAME&& words.";
text_type_3_top_1 = "Pick the missing word to complete the sentence.";
text_type_4_top_1 = text_type_3_top_1;
text_type_5_top_1 = "Arrange the words into a perfect sentence.";
text_type_6_top_1 = "Match each paragraph to the correct heading in the multiple-choice format.";

top_text = text_type_1_top_3;
cur_round = 1;
total_round = 5;
start_time = 20;
cur_time = start_time;
time_text = string(cur_time)+"s";
round_text = string(cur_round)+"/"+string(total_round);
target_text_to_speak = "Test";
text_solve = "Solve this sentence";
test_cur_round = 1;
test_total_round = 12;

_val_game2_type1 = [];
_val_game2_type2 = [];

diff_level = 0; //Testing mode
display_stage = 0; //Intro
last_stage = 0;
next_stage = 0;
//People Cache
loaded = false;
text_blob = "";
text = "";
t_level = "1";

data_map = undefined;

iUID = 1;
social_id = "";
sUserName = "";
sChatName = "";
iLevel = 1;
sSocialIconLink = "";
iLocalIconIndex = 0;
sprIcon = spr_profile_heads;

draw_question_game6 = false;
ret_text = "";

htp_text = "How to play";


//Game Play Data
marshmen_count = 4;
marshmen_values = "";
for(var i = 0; i < marshmen_count; i++) {
    marshmen_values[i] = irandom_range(1,100);
}

marshmen_answers_count = 1;
marshmen_order = true;
marshmen_answers = "";
marshmen_display = ""; //Array of displayed answers for type 3 and 4
marshmen_answers[0] = marshmen_values[1];

inputs_needed = 1;
inputs = 0;
c_counter = 0;
input_val = "";

ret_value = "";
ret_man = noone;

//Reset stuff
force_end = false;
allowed_retrys = 1;

//Players results data
num_correct = 0;
round_value = 0;

test_timer_tock = false;
test_timer_tick = 0;
test_timer_time = 0;

text_game6 = "";
player_type_1_mode_1 = "";
player_type_1_mode_2 = "";
player_type_1_mode_3 = "";
player_type_2_mode_1 = "";
player_type_2_mode_2 = "";
player_type_3_mode_1 = "";
player_type_4_mode_1 = "";
player_type_5_mode_1 = "";
player_type_6_mode_1 = "";

did_do_seven = false;

call_from_prolog_skip = false;

var checksum = ds_exists(eval_game1_numbers, ds_type_list);
if(checksum && ds_list_size(eval_game1_numbers) > 0) {
    checksum = ds_exists(eval_game1_letters, ds_type_list);
    if(checksum && ds_list_size(eval_game1_letters) > 0) {
		checksum = 1;
        } else { 
        checksum = 0;
    }
}

if(eval_data_preloaded && checksum){  
    event_user(7);
}else{
    show_debug_message("Eval game - the data has not finished preloading, force loading it now!");
    scp_preload_mg0_data(false);
}

player_retrys = 0;

//Data to pull from (so it can reset for every X question instead of every question
round_data_list = ds_list_create();

//to detect if Game-Type 2 realy started
isType2Started = false;

already_progressed = false;

randomed_index1 = ds_list_create();
randomed_index2 = ds_list_create();


elements_layer = layer_exists_create(my_depth() - 2);
marsh_lay_top = layer_exists_create(my_depth()-2);
marsh_lay_bot = layer_exists_create(my_depth()-3);

//update en tts rate
perform_event(_TTS, 1);

// text size control
txt_htp_scale = 1;
txt_htp_maxscale = 0.4;

lst = "";
prol_skip = "";
isRound_correct = 0;

scheduled_event = -1;

scp_preload_mg0_data();


function f_resetDefaultSettings(_inputs, _mcount, _mans, _mord, _mtot, _sta) {                               
    inputs_needed = _inputs;
    marshmen_count = _mcount;
    marshmen_answers_count = _mans;
    marshmen_order = _mord;
    total_round = _mtot;
    start_time = _sta;
}

function f_mango(_index){
	marshmen_values = scp_split_string(game2_type2_answers[_index], ",");
    var dis = scp_split_string(game2_type2_distractions[_index], ",");

    for(var i = 0; i < array_length(dis); i++) {
        ds_list_add(t_list, dis[i]);
    }  
                          
    marshmen_answers = scp_split_string(game2_type2_answers[_index], ",");
}

function f_apple(){
	for(var i = 0; i < marshmen_count; i++) {
        var ts = ds_list_size(round_data_list);
        var idx = irandom_range(0, ts-1);
        var vvv = ds_list_find_value(round_data_list, idx);
        ds_list_delete(round_data_list, idx);
        show_debug("Got - " + string(vvv) + " - Value for Type 1 Mode - " + string(type_1_mode));
        marshmen_values[i] = vvv;
    }
}

function f_durian(){
    marshmen_values = scp_split_string(game3_values[round_value], ","); 
    marshmen_count = array_length(marshmen_values);
                  
    marshmen_answers[0] = game3_answers[round_value];
        
    var lnt = string_length(marshmen_answers[0]);
    lst = "";
    for(var i = 0; i < lnt; i++) {
        lst += "-";
    }
}

function f_banana(){
	var tt = 0;
    while(tt < marshmen_count) {
        var i, j, k;
        for (i = 0; i < marshmen_count; i += 1) {
            j = irandom_range(i, marshmen_count - 1);
            if (i != j) {
                k = marshmen_values[i];
                marshmen_values[i] = marshmen_values[j];
                marshmen_values[j] = k;
            }
        }
        tt++;
    }
}

function f_cherry(){
    marshmen_values = scp_split_string(game4_values[round_value], ","); 
    marshmen_count = array_length(marshmen_values);
                  
    marshmen_answers[0] = game4_answers[round_value];
}

function f_mouse(){
	var per_level = marshmen_count div 2; 
    var ext = marshmen_count % 2;
        
    var mof = 0;
    var mdst = 265;
    if(marshmen_count > 5) {
        mof = 0;
        mdst = 265;
    } else {
        mof = 115;
        mdst = 305;
    }
        
    var top = y-100;
    var bot = y-12;
        
    var st_x = x - 405 + mof;
    var sp_x = mdst;
        
    var j = 0;
                
    for(var i = 0; i < per_level + ext; i++) {
        b_no = createButtonTargeted(st_x + (i*sp_x), top, marsh_lay_top, o_marshman, id, 5);
        b_no.text = string(marshmen_values[j]);
        b_no.dvalue = marshmen_values[j];
        if(scp_value_in_array(string(marshmen_values[j]), marshmen_answers) == true) {
            b_no.danswer = marshmen_values[j];
        }
        j++;
    }
        
    var st_x = x - 260 + mof;
    var sp_x = mdst;
        
    for(var i = 0; i < per_level; i++) {
        b_no = createButtonTargeted(st_x + (i*sp_x), bot, marsh_lay_bot, o_marshman, id, 5);
        b_no.text = string(marshmen_values[j]);
        b_no.dvalue = marshmen_values[j];
        if(scp_value_in_array(string(marshmen_values[j]), marshmen_answers) == true) {
            b_no.danswer = marshmen_values[j];
        }
        j++;
    }    
                
    b_no = noone;
}

function f_kiwi(){
    marshmen_values = scp_split_string(game5_values[round_value], ","); 
    marshmen_count = array_length(marshmen_values);
    inputs_needed = marshmen_count;
        
    marshmen_answers[0] = game5_answers[round_value];
}

function f_cat(){
	marshmen_display = scp_split_string(game5_values[round_value], ","); 
    var ss = array_length(marshmen_display);
  
    for(var i = 0; i < ss; i++) {
        var tt = string(marshmen_display[i]);
        if(string_count("&amp;c&amp;", tt)) {
            marshmen_display[i] = string_replace(tt, "&amp;c&amp;", ",");
        }
                        
        var tt = string(marshmen_values[i]);
        if(string_count("&amp;c&amp;", tt)) {
            marshmen_values[i] = string_replace(tt, "&amp;c&amp;", ",");
        }
    }
}

function f_grape(){
	marshmen_answers[0] = marshmen_values[irandom_range(0, marshmen_count-1)];
	var dx = 0;
	if(array_length(game_1_repeat_question_arr) > 0){
		while(marshmen_answers[0] == game_1_repeat_question_arr[dx]){
			marshmen_answers[0] = marshmen_values[irandom_range(0, marshmen_count-1)];
		}
	}
}
function f_strawberry(_index){
	marshmen_values = scp_split_string(game2_type1_answers[_index], ",");
    var dis = scp_split_string(game2_type1_distractions[_index], ",");

    for(var i = 0; i < array_length(dis); i++) {
        ds_list_add(t_list, dis[i]);
    }  
                          
    marshmen_answers = scp_split_string(game2_type1_answers[_index], ",");
}

function f_dog(){
	marshmen_answers[0] = game6_answers[round_value];
}
	
function f_bee(){
    var per_level = marshmen_count div 2; 
    var ext = marshmen_count % 2;
        
    var top = y+52;
    var bot = y+122;
        
    var st_x = x - 405;
    var sp_x = 265;
        
    var j = 0;
                
    for(var i = 0; i < per_level + ext; i++) {
        b_no = createButtonTargeted(st_x + (i*sp_x), top, marsh_lay_top, o_marshman, id, 5);
        b_no.text = string(marshmen_values[j]);
        b_no.dvalue = marshmen_values[j];
        if(scp_value_in_array(string(marshmen_values[j]), marshmen_answers) == true) {
            b_no.danswer = marshmen_values[j];
        }
		j++;
    }
        
    var st_x = x - 270;
    var sp_x = 265;
        
    for(var i = 0; i < per_level; i++) {
        b_no = createButtonTargeted(st_x + (i*sp_x), bot, marsh_lay_bot, o_marshman, id, 5);
        b_no.text = string(marshmen_values[j]);
        b_no.dvalue = marshmen_values[j];
        if(scp_value_in_array(string(marshmen_values[j]), marshmen_answers) == true) {
            b_no.danswer = marshmen_values[j];
        }
		j++;
    }        
        
    b_no = noone;
}
	
function f_lizard(){
    var per_level = marshmen_count div 2; 
    var ext = marshmen_count % 2;
        
    var mof = 0;
    var mdst = 265;
    if(marshmen_count > 5) {
        mof = 0;
        mdst = 265;
    } else {
        mof = 115;
        mdst = 305;
    }
        
    var top = y-100;
    var bot = y-12;
        
    var st_x = x - 405 + mof;
    var sp_x = mdst;
        
    var j = 0;
                
    for(var i = 0; i < per_level + ext; i++) {
        b_no = createButtonTargeted(st_x + (i*sp_x), top, marsh_lay_top, o_marshman, id, 5);
        b_no.text = string(marshmen_values[j]);
        b_no.dvalue = marshmen_values[j];
        if(scp_value_in_array(string(marshmen_values[j]), marshmen_answers) == true) {
            b_no.danswer = marshmen_values[j];
        }
        j++;
    }
        
    var st_x = x - 260 + mof;
    var sp_x = mdst;
        
    for(var i = 0; i < per_level; i++) {
        b_no = createButtonTargeted(st_x + (i*sp_x), bot, marsh_lay_bot, o_marshman, id, 5);
        b_no.text = string(marshmen_values[j]);
        b_no.dvalue = marshmen_values[j];
        if(scp_value_in_array(string(marshmen_values[j]), marshmen_answers) == true) {
            b_no.danswer = marshmen_values[j];
        }
        j++;
    }    
                
    b_no = noone;
}

function f_snake(){
	var per_level = marshmen_count div 2; 
    var ext = marshmen_count % 2;
        
    var top = y+52;
    var bot = y+122;
        
    var st_x = x - 100;
    var sp_x = 200;
        
    var j = 0;
                
    for(var i = 0; i < per_level + ext; i++) {
        b_no = createButtonTargeted(st_x + (i*sp_x), bot, marsh_lay_top, o_marshman, id, 5);
        b_no.text = string(marshmen_values[j]);
        b_no.dvalue = marshmen_values[j];
        b_no.danswer = marshmen_answers[0];
		if(type_1_mode == 1){
			with(o_marshman){
				if(dvalue == danswer){
					draw_hand = true;
				}
			}
		}
        j++;
    }
		
    var st_x = x - 300;
    var sp_x = 600;
        
    for(var i = 0; i < per_level; i++) {
        b_no = createButtonTargeted(st_x + (i*sp_x), bot, marsh_lay_bot, o_marshman, id, 5);
        b_no.text = string(marshmen_values[j]);
        b_no.dvalue = marshmen_values[j];
        if(string(marshmen_values[j]) == string(marshmen_answers[0])) {
            b_no.danswer = marshmen_values[j];
        }
		if(type_1_mode == 1){
			with(o_marshman){
				if(dvalue == danswer){
					draw_hand = true;
				}
			}
		}
        j++;
    }     
        
    b_no = noone;
	hand_x = o_marshman.x+30;
	hand_y = o_marshman.y+60;
}

function f_tiger(){
	var per_level = marshmen_count div 2; 
    var ext = marshmen_count % 2;
        
    var mof = 0;
    var mdst = 265;
    if(marshmen_count > 5) {
        mof = 50;
        mdst = 270;
        if(marshmen_count > 6) {
            mof = 10;
            mdst = 265;
        }
    } else {
        mof = 110;
        mdst = 305;
    }
        
    var top = y-100;
    var bot = y-12;
        
    var st_x = x - 405 + mof;
    var sp_x = mdst;
        
    var j = 0;
                
    for(var i = 0; i < per_level + ext; i++) {
        b_no = createButtonTargeted(st_x + (i*sp_x), top, marsh_lay_top, o_marshman, id, 5);
        b_no.text = string(marshmen_values[j]);
        b_no.dvalue = marshmen_values[j];
        if(scp_value_in_array(string(marshmen_values[j]), marshmen_answers) == true) {
            b_no.danswer = marshmen_values[j];
        }
        j++;
    }
        
    var st_x = x - 260 + mof;
    var sp_x = mdst;
        
    for(var i = 0; i < per_level; i++) {
        b_no = createButtonTargeted(st_x + (i*sp_x), bot, marsh_lay_bot, o_marshman, id, 5);
        b_no.text = string(marshmen_values[j]);
        b_no.dvalue = marshmen_values[j];
        if(scp_value_in_array(string(marshmen_values[j]), marshmen_answers) == true) {
            b_no.danswer = marshmen_values[j];
        }
        j++;
    }    
        
    var dis_y = y + 160;
    var st_x = x - 425;                
    var nn = array_length_1d(marshmen_display);
    var sp_x = clamp(scp_safe_divide(850,nn-1),120,240);
        
    for(var i = 0; i < nn; i++) {
        b_no = createButtonTargeted(st_x + (i*sp_x), dis_y, elements_layer, o_marshman, id, 5);
        b_no.text = "";
        b_no.dvalue = marshmen_display[i];
        b_no.display_only = true;
        b_no.can_return = true;
        b_no.f_c = c_dkgray;
        b_no.b_c = c_ltgray;
        b_no.fn_sz = 0.9;
        b_no.image_xscale = 0.50;
        b_no.image_yscale = 0.50;
        b_no.p_xscale_start = 0.50;
        b_no.p_yscale_start = 0.50;
        b_no.sprite_index = spr_marshman_outline;
        b_no.display_index = i;
    }    
        
    b_no = noone;
}

function f_lion(){
	var per_level = marshmen_count div 2; 
    var ext = marshmen_count % 2;
        
    var top = y+132;
    var bot = y+232;
        
    var st_x = x - 255;
    var sp_x = 510;
        
    var j = 0;
                
    for(var i = 0; i < per_level + ext; i++) {
        b_no = createButtonTargeted(st_x + (i*sp_x), top, marsh_lay_top, o_marshman, id, 5);
        var tt_xt = string(marshmen_values[j]);
        b_no.text = scp_split_at_nearest_char(tt_xt,28);
        b_no.dvalue = marshmen_values[j];
        b_no.danswer = marshmen_answers[0];
        j++;
    }
        
		
    var st_x = x - 255;
    var sp_x = 510;
        
    for(var i = 0; i < per_level; i++) {
        b_no = createButtonTargeted(st_x + (i*sp_x), bot, marsh_lay_bot, o_marshman, id, 5);
        var tt_xt = string(marshmen_values[j]);
		b_no.text = scp_split_at_nearest_char(tt_xt,28);
        b_no.dvalue = marshmen_values[j];
        if(string(marshmen_values[j]) == string(marshmen_answers[0])) {
            b_no.danswer = marshmen_values[j];
        }
        j++;
    }     
        
	with(o_marshman){
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
	}
		
    b_no = noone;
	hand_x = o_marshman.x+30;
	hand_y = o_marshman.y+60;
}

function f_butterfly(){
    for(var i = marshmen_answers_count; i < marshmen_count; i++) {
        var ts = ds_list_size(t_list);
        var idx = irandom_range(0, ts-1);
        var vxx = ds_list_find_value(t_list, idx);
        ds_list_delete(t_list, idx);
        show_debug("Got - " + string(vxx) + " - Value for Type 2 Mode - " + string(type_2_mode));
        marshmen_values[i] = vxx;
    }
    ds_list_destroy_safe(t_list);
        
    var tt = 0;
    while(tt < marshmen_count) {
        var i, j, k;
        for (i = 0; i < marshmen_count; i += 1) {
            j = irandom_range(i, marshmen_count - 1);
            if (i != j) {
                k = marshmen_values[i];
                marshmen_values[i] = marshmen_values[j];
                marshmen_values[j] = k;
            }
        }
        tt++;
    }
}