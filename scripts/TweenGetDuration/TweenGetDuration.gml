/// @description  TweenGetDuration(tween)
/// @function  TweenGetDuration
/// @param tween
function TweenGetDuration(argument0) {

	if (argument0)
	{
	    var _tween = global.TGMS_MAP_TWEEN[1][? argument0];
	    return _tween[TWEEN.DURATION];
	}



}
