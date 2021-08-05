/// @description  TweenReverse(tween)
/// @function  TweenReverse
/// @param tween
function TweenReverse(argument0) {

	if (argument0)
	{
	    var _t = global.TGMS_MAP_TWEEN[1][? argument0];
    
	    if (_t[TWEEN.STATE] >= TWEEN_STATE.PAUSED)
	    {
	        _t[@ TWEEN.DIRECTION] = -_t[TWEEN.DIRECTION];
	        _t[@ TWEEN.TIME_SCALE] = -_t[TWEEN.TIME_SCALE];
	        TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EVENT.REVERSE);
	    }
	}



}
