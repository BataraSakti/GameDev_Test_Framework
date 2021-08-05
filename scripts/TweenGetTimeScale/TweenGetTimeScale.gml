/// @description  TweenGetTimeScale(tween)
/// @function  TweenGetTimeScale
/// @param tween
function TweenGetTimeScale(argument0) {

	if (argument0)
	{
	    var _tween = global.TGMS_MAP_TWEEN[1][? argument0];
	    return _tween[TWEEN.TIME_SCALE] * _tween[TWEEN.DIRECTION];
	}



}
