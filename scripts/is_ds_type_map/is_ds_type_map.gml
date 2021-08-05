///@description is_ds_type_map(ds_id)
///@function is_ds_type_map
///@param ds_id
function is_ds_type_map() {

	var _ds_id = argument[0];
	var _is_valid = true;
	
	if (is_undefined(_ds_id)) {
		_is_valid = false;
	}
	
	if(is_ptr(_ds_id)) { _is_valid = false; }
	
	if (_is_valid && is_array(_ds_id)){
		//Check for QS map
		if(qs_exists(_ds_id, ds_type_map)) {
			return is_ds_type_map(_ds_id[1]);
		} else { 
			_is_valid = false;
		}
	}

	if (_is_valid && is_string(_ds_id)) {
		_is_valid = false;
	}

	if (_is_valid) {
		
		if (is_struct(_ds_id)){return false;}
		if (!ds_exists(_ds_id, ds_type_map)) {
			_is_valid = false;
		}
	}

	return _is_valid;
}
