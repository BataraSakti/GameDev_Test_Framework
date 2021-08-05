///@description Yes

show_debug("btn_gui_confirm_no skip_confirm = "+string(skip_confirm)+", game_mode = "+string(game_mode)+", game_diff = "+string(game_diff)+", message = "+string(message));


with(_target) {
	show_debug(object_get_name(other.object_index) + " calling _target " 
		+ object_get_name(other._target.object_index) + " _target_event " + string(other._target_event));
    event_user(other._target_event);
}

event_user(0);

