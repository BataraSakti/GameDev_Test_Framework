// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function is_invalid(){
	var _is_invalid = false;
	var _data = argument[0];
	
	
	if (is_undefined(_data)){
		_is_invalid = true;
	}
	
	if (_data == "undefined"){
		_is_invalid = true;
	}
	
	if (_data == noone){
		_is_invalid = true;
	}
	
	if (argument_count > 1){
		var _invalid_data = argument[1];
		if (_data == _invalid_data) {
			_is_invalid = true;
		}
	}
	
	return _is_invalid;
}