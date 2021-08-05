///@description is_valid_instance(value)
///@function is_valid_instance
///@param value

function is_valid_instance(value) {
	var _is_valid = true;

	if (is_undefined(value)) { _is_valid = false; }
	if (value == noone) { _is_valid = false; }	
	if (is_string(value)) { _is_valid = false; }
	if (is_array(value)) { _is_valid = false; }
	if (_is_valid) { _is_valid = instance_exists(value); }
	
	return _is_valid;
}

///@description is_sprite(value)
///@function is_sprite
///@param value
function is_sprite(value) {
	var _is_valid = true;
	
	if (is_undefined(value)) { _is_valid = false; }
	if (value == noone) { _is_valid = false; }	
	//if (is_string(value)) { _is_valid = false; } yoyo obscurity that sprites return true
	if(_is_valid) { _is_valid = sprite_exists(value); }
	
	return _is_valid;
}