/// @description  TGMS_TweenDelayOnEventAdd(params,EVENT_TYPE)
/// @function  TGMS_TweenDelayOnEventAdd
/// @param params
/// @param EVENT_TYPE
function TGMS_TweenDelayOnEventAdd(argument0, argument1) {
	// return: callback handle

	if (argument0[0])
	{
	    var _d = global.TGMS_MAP_DELAY[1][? argument0[0]];
	    var _events = _d[TWEEN_DELAY.EVENTS];
	    var _cb;
    
	    // Create and assign events map if it doesn't exist
	    if (_events == -1)
	    {
	        _events = qs_map_create();
	        _d[@ TWEEN_DELAY.EVENTS] = _events;
	    }
    
	    // Add callback arguments
	    var _index = array_length_1d(argument0);
	    repeat(_index-3)
	    {
	        _index--;
	        _cb[_index] = argument0[_index];
	    }
    
	    // Assign script to callback
	    _cb[TWEEN_CALLBACK.SCRIPT] = argument0[2]; 
	    // Assign target to callback
	    _cb[TWEEN_CALLBACK.TARGET] = argument0[1];
	    // Store callback index handle inside callback
	    _cb[TWEEN_CALLBACK.ID] = ++global.TGMS_INDEX_CALLBACK;
	    // Assign callback handle to callback map
	    global.TGMS_MAP_CALLBACK[1][? global.TGMS_INDEX_CALLBACK] = _cb;
    
	    // IF event type exists...
	    // ELSE...
	    if (qs_map_exists(_events, argument1))
	    {
	        var _event = _events[1][? argument1];
    
	        // Add event to events map
	        qs_list_add(_event, _cb);
        
	        // Do some event callback cleanup if size starts to get larger than expected
	        if (qs_list_size(_event) mod 10 == 0)
	        {   
	            qs_priority_add(SharedTweener().eventCleaner, _event, _event);
	        }
	    }
	    else
	    {
	        // Create event list
	        var _event = qs_list_create();
	        // Add active state and callback to event
	        qs_list_add(_event, true, _cb);
	        // Add event to events map
	        _events[1][? argument1] = _event;
	    }
    
	    // Return callback handle
	    return global.TGMS_INDEX_CALLBACK;
	}



}
