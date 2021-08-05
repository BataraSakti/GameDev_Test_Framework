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

