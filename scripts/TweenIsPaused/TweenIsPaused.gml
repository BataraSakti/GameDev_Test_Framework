/// @description  TweenIsPaused(tween)
/// @function  TweenIsPaused
/// @param tween
function TweenIsPaused(argument0) {

	if (argument0)
	{
	    var _tween = global.TGMS_MAP_TWEEN[1][? argument0];
		if (!is_array(_tween)){
			return false;
		} else {
			return _tween[TWEEN.STATE] == TWEEN_STATE.PAUSED;
		}
	}



}
