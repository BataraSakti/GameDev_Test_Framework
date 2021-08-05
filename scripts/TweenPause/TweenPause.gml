/// @description  TweenPause(tween)
/// @function  TweenPause
/// @param tween
function TweenPause(argument0) {

	if (argument0)
	{
	    var _t = global.TGMS_MAP_TWEEN[1][? argument0];
	    if (is_array(_t)){
		    if (_t[TWEEN.STATE] >= 0)
		    {
		        _t[@ TWEEN.STATE] = TWEEN_STATE.PAUSED;
		        TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EVENT.PAUSE);
		    }
		}
	}



}
