///@description scp_create_warning_drawer(x, y, text, isBottom, drawer_object)
///@param x
///@param y
///@param text
///@param isBottom
///@param ui_object
function scp_create_warning_drawer() {


	var _x = argument[0];
	var _y = argument[1];
	var _text = argument[2];
	var _isBot = argument[3];
	var _ui_object = argument[4];

	var _dw = create_instance_layer(_x, _y, global.layer_user_confirm, _ui_object);
	with(_dw){
		if(_text != ""){
			text = _text;
		}
		isBottom = _isBot;
	}




}
