/// @description  TGMS_TweenDelayOnEventClear(delay,EVENT_TYPE)
/// @function  TGMS_TweenDelayOnEventClear
/// @param delay
/// @param EVENT_TYPE
function TGMS_TweenDelayOnEventClear(argument0, argument1) {

	if (argument0)
	{
	    var _delay = global.TGMS_MAP_DELAY[1][? argument0];
	    var _events = _delay[TWEEN_DELAY.EVENTS];
    
	    if (_events != -1)
	    {
	        if (qs_map_exists(_events, argument1))
	        {    
	            var _event = _events[1][? argument1]; 
	            var _index = 0;
            
	            repeat(qs_list_size(_event)-1)
	            {
	                var _cb = _event[1][| ++_index];
	                _cb[@ TWEEN_CALLBACK.TARGET] = noone;
	                qs_map_delete(global.TGMS_MAP_CALLBACK, _cb[TWEEN_CALLBACK.ID]);
	            }
	        }
	    }
	}



}
