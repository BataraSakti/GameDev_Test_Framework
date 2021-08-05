/// @description  TweenGetDestination(tween)
/// @function  TweenGetDestination
/// @param tween
function TweenGetDestination(argument0) {

	if (argument0)
	{
	    var _tween = global.TGMS_MAP_TWEEN[1][? argument0];
	    return _tween[TWEEN.START] + _tween[TWEEN.CHANGE];
	}



}
