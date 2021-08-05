total_pep = 0;
total_made_friend = 0;
if (instance_exists(btn_game_gui_close)){
	with(btn_game_gui_close){
		show_debug("btn_gui_confirm_no destroying btn_game_gui_close");
        instance_destroy();
    }
}

event_inherited();
skip_confirm = false;
text = "";//localizedString("login");
game_mode = -1;
game_diff = -1;
game_time = 0;

round_count = 0;

if(instance_number(p_gui_mg_parent) > 0) {
	var tt = instance_find(p_gui_mg_parent, 0);
	if(variable_instance_exists(tt, "diff_level")) {
		game_diff = tt.diff_level;
		show_debug(object_get_name(object_index) + " set difficulty to: " + string(game_diff));
	}
}

message = "";
confirm_t_key = "confirm";

//confirm_b_key = "confirm_exit";
confirm_b_key = "";



