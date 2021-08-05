/// @description stringListToList(string, delimiter)
/// @function stringListToList
/// @param string
/// @param  delimiter
function stringListToList(argument0, argument1) {

	var sp_ = scp_split_string(argument0,argument1);
	var lst_ = ds_list_create();
	var sz_ = array_length_1d(sp_);
	for(var i = 0; i < sz_; i++) {
	    ds_list_add(lst_, sp_[i]);
	}

	return lst_;



}
