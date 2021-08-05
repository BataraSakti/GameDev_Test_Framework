/// @description create_popup_screen(x,y,target,layer,yes_event,text,btn_yes_sprite,btn_yes_image_index,draw_player_info[,btn_no_sprite,no_event,btn_no_image_index,player_name,player_city,player_avatar]);
/// @param x
/// @param y
/// @param target
/// @param layer
/// @param  yes_event
/// @param  text
/// @param   btn_yes_sprite
/// @param btn_yes_image_index
/// @param  draw_player_info[
/// @param  no_event
/// @param btn_no_sprite
/// @param btn_no_image_index
/// @param  player_name
/// @param player_city
/// @param player_avatar]
function create_popup_screen() {


	var _x = argument[0];
	var _y = argument[1];
	var _target = argument[2];
	var _layer = argument[3];
	var _yes_event = argument[4];
	var _text = argument[5];
	var _btn_yes_sprite = argument[6];
	var _btn_yes_image_index = argument[7];
	var _draw_player_info = argument[8];
	var _btn_no_sprite = noone;
	var _btn_no_event = noone;
	var _btn_no_image_index = noone;
	var _player_name = "";
	var _player_city = "";
	var _player_avatar = -1;
	if(argument_count>=10){
		_btn_no_event = argument[9];	
		if(argument_count>=11){
			_btn_no_sprite =argument[10];
			if(argument_count>=12){
				_btn_no_image_index = argument[11];
				if(argument_count>=13){
					_player_name = argument[12];
					if(argument_count>=14){
						_player_city = argument[13];
						if(argument_count>=15){
							_player_avatar = argument[14];
				
						}				
					}
				}
			}
		}
	}
	var screen = instance_create_layer(_x,_y,_layer,popup_screen);
	with(screen){
		_parent = _target;
		btn_1_event = _yes_event;
		btn_1_sprite = _btn_yes_sprite;
		draw_player_info = _draw_player_info;
		btn_1_image_index = _btn_yes_image_index;
		text = _text;
		if(_player_name != "" && _player_city != "" && _player_avatar!= -1){
			player_name = _player_name;
			player_city = _player_city;
			player_avatar = _player_avatar;
		}else{
			show_debug("No user information - so skip drawing it!");
			draw_player_info = false;
		}

		if(_btn_no_event != noone && _btn_no_event != noone){
			btns_number = 2;
			btn_2_event = _btn_no_event;
			btn_2_sprite = _btn_no_sprite;
			if(_btn_no_image_index!=noone){
				btn_2_image_index = _btn_no_image_index;
			}
		}
		event_user(0);
	}

	return screen;


}
