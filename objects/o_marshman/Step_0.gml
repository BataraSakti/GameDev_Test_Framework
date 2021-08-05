/// @description Insert description here
// You can write your code in this editor
event_inherited();
if(_nine_slice){
	if(mouse_check_button_released(mb_left)){
		if(point_in_rectangle(mouse_x, mouse_y, x - ns_width / 2, y - ns_height / 2, x + ns_width / 2, y + ns_height / 2)){
				//check for clickthrough
				//for(var i = 0; i < array_length_1d(ignore_click_arr); i++){
				//	if(instance_exists(ignore_click_arr[i])){
				//		show_debug("btn_alliance caught clickthrough: " + string(ignore_click_arr[i]));
				//		exit;
				//	}
				//}
			event_perform(ev_mouse, ev_left_press);
			event_perform(ev_mouse, ev_left_release);
		}
	}
}