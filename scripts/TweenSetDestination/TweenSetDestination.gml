/// @description  TweenSetDestination(tween,destination)
/// @function  TweenSetDestination
/// @param tween
/// @param destination
function TweenSetDestination(argument0, argument1) {

	if (argument0)
	{
	    var _tween = global.TGMS_MAP_TWEEN[1][? argument0];
	    _tween[@ TWEEN.CHANGE] = argument1 -_tween[TWEEN.START];
	}



}
