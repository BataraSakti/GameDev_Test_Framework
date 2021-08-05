//show_debug(object_get_name(object_index) + " left pressed");
if(is_imploding == true) { exit; }
if(can_click == 0) { exit; }

sprite_index = press;

was_pressed = true;
press_start_time = current_time;
press_pressed_time = 0;