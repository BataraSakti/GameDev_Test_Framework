/// @description  TweenIsStopped(tween)
/// @function  TweenIsStopped
/// @param tween
function TweenIsStopped(argument0) {

	if (argument0)
	{
	    var _tween = global.TGMS_MAP_TWEEN[1][? argument0];
	    return _tween[TWEEN.STATE] == TWEEN_STATE.STOPPED;
	}



}
