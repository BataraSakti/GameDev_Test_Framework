/// @description  TweenSetEase(tween,ease)
/// @function  TweenSetEase
/// @param tween
/// @param ease
function TweenSetEase(argument0, argument1) {

	if (argument0)
	{
	    var _tween = global.TGMS_MAP_TWEEN[1][? argument0];
	    _tween[@ TWEEN.EASE] = argument1;
	}



}
