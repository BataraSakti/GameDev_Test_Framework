///@description array_push(array, value, [FIFO])	
///@function array_push()
///@param array
///@param value or array
///@param [FIFO]
function scp_array_push() {

	var fifo = true;//True - insert at the back, False - insert at the front
	var ar = argument[0];
	if(argument_count > 2) { fifo = argument[2]; }

	var siz = array_length_1d(ar);
	if(fifo) {
		if(is_array(argument[1])) {
			var val_ar = argument[1];
			array_copy(ar, siz, val_ar, 0, array_length_1d(val_ar));
		} else {
			ar[@ siz] = argument[1];
		}
	} else {
		if(is_array(argument[1])) {
			var val_ar = argument[1];
			var temp_ar = [];
			array_copy(temp_ar, 0, val_ar, 0, array_length_1d(val_ar));
			array_copy(temp_ar, array_length_1d(temp_ar), ar, 0, siz);
			ar = temp_ar;
		} else {
			var temp_ar = [];
			temp_ar[0] = argument[1];
			array_copy(temp_ar, 1, ar, 0, siz);
		}
	}


}
