/// @description  TweenGetChange(tween)
/// @function  TweenGetChange
/// @param tween
function TweenGetChange(argument0) {

	if (argument0)
	{
	    var _tween = global.TGMS_MAP_TWEEN[1][? argument0];
	    return _tween[TWEEN.CHANGE];
	}



}
