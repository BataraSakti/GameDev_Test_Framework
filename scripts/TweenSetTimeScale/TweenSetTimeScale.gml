/// @description  TweenSetTimeScale(tween,scale)
/// @function  TweenSetTimeScale
/// @param tween
/// @param scale
function TweenSetTimeScale(argument0, argument1) {

	if (argument0)
	{
	    var _tween = global.TGMS_MAP_TWEEN[1][? argument0];
	    _tween[@ TWEEN.TIME_SCALE] = argument1 * _tween[TWEEN.DIRECTION];
	}



}
