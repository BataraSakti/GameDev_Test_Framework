/// @description  TweenGetTime(tween)
/// @function  TweenGetTime
/// @param tween
function TweenGetTime(argument0) {

	if (argument0)
	{
	    var _tween = global.TGMS_MAP_TWEEN[1][? argument0];
		if(is_array(_tween)){
			return _tween[TWEEN.TIME];
		} else {
			return 0;
		}
	}



}
