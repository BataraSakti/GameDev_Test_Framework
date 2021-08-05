/// @description scp_list_to_array(list)
/// @function scp_list_to_array
/// @param list
function scp_list_to_array(argument0) {

	var list = argument0;
	var arr = [];

	///var sss = ds_list_size(list);

	//if(sss == 0) {
	//	arr[0] = "";
	//	return arr; 
	//} else {
		for(var i = 0; i < ds_list_size(list); i++){
		    arr[i] = ds_list_find_value(list, i);
		}

		return arr;
	//}


}


///@description scp_array_to_list(array)
///@function scp_array_to_list
///@param array
function scp_array_to_list(argument0){
	var _array = argument0;
	var _list = ds_list_create();
	
	for (var i = 0; i < array_length(_array); i++){
		ds_list_add(_list, _array[i]);
	}
	
	return _list;
}
