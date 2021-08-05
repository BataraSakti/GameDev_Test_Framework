/// @description  TweenSetDuration(tween,duration)
/// @function  TweenSetDuration
/// @param tween
/// @param duration
function TweenSetDuration(argument0, argument1) {

	if (argument0)
	{
	    var _tween = global.TGMS_MAP_TWEEN[1][? argument0];
	    _tween[@ TWEEN.DURATION] = argument1;
	}



}
