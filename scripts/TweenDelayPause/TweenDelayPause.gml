/// @description  TweenDelayPause(tween,[delay])
/// @function  TweenDelayPause
/// @param tween
/// @param [delay]
function TweenDelayPause() {

	if (argument[0])
	{
	    if (argument_count == 1)
	    {
	        var _tween = global.TGMS_MAP_TWEEN[1][? argument[0]];
	        var _delays = _tween[TWEEN.DELAYS];
        
	        // IF delays list exists
	        if (_delays != -1)
	        {
	            var _index = -1;
	            repeat(ds_list_size(_delays))
	            {
	                var _delay = _delays[| ++_index]; 
                
	                if (_delay[TWEEN_DELAY.STATE] == TWEEN_DELAY_STATE.PLAYING)
	                {
	                    _delay[@ TWEEN_DELAY.STATE] = TWEEN_DELAY_STATE.PAUSED;
	                    TGMS_ExecuteEvent(_delay[TWEEN_DELAY.EVENTS], TWEEN_DELAY_EVENT.PAUSE);
	                }
	            }
	        }
	    }
	    else
	    {
	        var _delay = global.TGMS_MAP_DELAY[1][? argument[1]];
    
	        if (_delay[TWEEN_DELAY.STATE] == TWEEN_DELAY_STATE.PLAYING)
	        {
	            _delay[@ TWEEN_DELAY.STATE] = TWEEN_DELAY_STATE.PAUSED;
	            TGMS_ExecuteEvent(_delay[TWEEN_DELAY.EVENTS], TWEEN_DELAY_EVENT.PAUSE);
	        }
	    }
	}



}
