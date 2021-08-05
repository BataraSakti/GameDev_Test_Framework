/// @description  TweenGMS_Final()
/// @function  TweenGMS_Final
function TweenGMS_Final() {
	/*
	    !DO NOT CALL THIS!
	    Automatically called by the extension.
	*/

	qs_map_destroy(global.TGMS_MAP_TWEEN);
	qs_map_destroy(global.TGMS_MAP_DELAY);
	qs_map_destroy(global.TGMS_MAP_CALLBACK);



}
