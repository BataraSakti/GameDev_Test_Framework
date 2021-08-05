/// @description  singleton()
/// @function  singleton
function singleton() {
	/*
	    USAGE:
	        1- call the script at the FIRST LINE OF CODE of the creation event:
	            if (singleton()) {exit;}         
	*/

	if (instance_number(object_index)>1) {
		show_debug("Singlton Collision - " + string(object_get_name(object_index)));
	    instance_destroy();
	    return true;
	}
	persistent = true;
	return false;



}
