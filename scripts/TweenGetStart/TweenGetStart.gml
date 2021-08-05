/// @description  TweenGetStart(tween)
/// @function  TweenGetStart
/// @param tween
function TweenGetStart(argument0) {

	if (argument0)
	{
	    var _tween = global.TGMS_MAP_TWEEN[1][? argument0];
	    return _tween[TWEEN.START];
	}



}
