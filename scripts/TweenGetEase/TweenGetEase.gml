/// @description  TweenGetEase(tween)
/// @function  TweenGetEase
/// @param tween
function TweenGetEase(argument0) {

	if (argument0)
	{
	    var _tween = global.TGMS_MAP_TWEEN[1][? argument0];
		if (is_array(_tween)){
			return _tween[TWEEN.EASE];
		} else {
			return false;
		}
	}



}
