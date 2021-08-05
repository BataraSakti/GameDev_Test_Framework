///@description is_ds_type_list(ds_id)
///@function is_ds_type_list
///@param ds_id
function is_ds_type_list() {

	var _ds_id = argument[0];
	var _is_valid = true;

	if (is_undefined(_ds_id)) {
		_is_valid = false;
	}
	
	if (_is_valid && is_array(_ds_id)) {
		//Check for QS list
		if(qs_exists(_ds_id, ds_type_list)) {
			return is_ds_type_list(_ds_id[1]);
		} else { 
			_is_valid = false;
		}
	}

	if (_is_valid && is_string(_ds_id)) {
		_is_valid = false;
	}

	if (_is_valid) {
		if (!ds_exists(_ds_id, ds_type_list)) {
			_is_valid = false;
		}
	}

	return _is_valid;
}
