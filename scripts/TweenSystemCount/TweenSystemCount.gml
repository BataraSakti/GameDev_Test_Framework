/// @description  TweenSystemCount()
/// @function  TweenSystemCount
function TweenSystemCount() {
	/*
	    Returns total number of tweens in system excluding those in inactive persistent rooms
	*/

	return qs_list_size(SharedTweener().tweens);



}
