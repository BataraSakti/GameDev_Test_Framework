/// @description  TweenDelayGetTime(delay)
/// @function  TweenDelayGetTime
/// @param delay
function TweenDelayGetTime(argument0) {

	if (argument0)
	{
	    var _delay = global.TGMS_MAP_DELAY[1][? argument0];
	    var _tween = _delay[TWEEN_DELAY.TWEEN];
    
	    if (_tween[TWEEN.TARGET] != noone)
	    {
	        return _delay[TWEEN_DELAY.DELAY];
	    }
	}



}
