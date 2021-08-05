/// @description  TweenDelayCancel(tween,[delay])
/// @function  TweenDelayCancel
/// @param tween
/// @param [delay]
function TweenDelayCancel() {

	if (argument0)
	{
	    if (argument_count == 1)
	    {
	        // Get tween data
	        var _tween = global.TGMS_MAP_TWEEN[1][? argument[0]];
	        // Get tween delays
	        var _delays = _tween[TWEEN.DELAYS];
        
	        // IF delay list exists
	        if (_delays != -1)
	        {
	            // Iterate through all delays
	            var _index = -1;
	            repeat(ds_list_size(_delays))
	            {
	                // Fetch delay from list
	                var _delay = _delays[| ++_index]; 
                
	                if (_delay[TWEEN_DELAY.STATE] != TWEEN_DELAY_STATE.CANCELED)
	                {
	                    // Invalidate handle
	                    ds_map_delete(global.TGMS_MAP_DELAY, _delay[TWEEN_DELAY.ID]);
	                    // Clear self reference with null callback
	                    _delay[@ TWEEN_DELAY.ID] = 0;
	                    // Set state as canceled
	                    _delay[@ TWEEN_DELAY.STATE] = TWEEN_DELAY_STATE.CANCELED;
	                    // Execute cancel delay event
	                    TGMS_ExecuteEvent(_delay[TWEEN_DELAY.EVENTS], TWEEN_DELAY_EVENT.CANCEL);
	                }
	            }
	        }
	    }
	    else
	    {
	        // Get delay data
	        var _delay = global.TGMS_MAP_DELAY[1][? argument[1]];
        
	        if (_delay[TWEEN_DELAY.STATE] != TWEEN_DELAY_STATE.CANCELED)
	        {
	            // Invalidate delay handle
	            ds_map_delete(global.TGMS_MAP_DELAY, argument[1]);
	            // Set delay as canceled
	            _delay[@ TWEEN_DELAY.STATE] = TWEEN_DELAY_STATE.CANCELED;
	            // Clear self reference with null callback
	            _delay[@ TWEEN_DELAY.ID] = 0;
	            // Execute cancel delay event
	            TGMS_ExecuteEvent(_delay[TWEEN_DELAY.EVENTS], TWEEN_DELAY_EVENT.CANCEL);
	        }
	    }
	}



}
