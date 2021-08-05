/// @description  TGMS_TweenOnEventAdd(params,EVENT_TYPE)
/// @function  TGMS_TweenOnEventAdd
/// @param params
/// @param EVENT_TYPE
function TGMS_TweenOnEventAdd(argument0, argument1) {
	// return: callback handle

	if (argument0[0])
	{
	    var _t = global.TGMS_MAP_TWEEN[1][? argument0[0]];
	    var _events = _t[TWEEN.EVENTS];
	    var _cb;
    
	    // Create and assign events map if it doesn't exist
	    if (_events == -1)
	    {
	        _events = qs_map_create();
	        _t[@ TWEEN.EVENTS] = _events;
	    }
    
	    // Add callback arguments
	    var _index = array_length(argument0);
	    repeat(_index-3)
	    {
	        --_index;
	        _cb[_index] = argument0[_index];
	    }
    
	    // Store new callback index handle inside callback
	    _cb[TWEEN_CALLBACK.ID] = ++global.TGMS_INDEX_CALLBACK;
	    // Assign script to callback
	    _cb[TWEEN_CALLBACK.SCRIPT] = argument0[2]; 
	    // Assign target to callback
	    _cb[TWEEN_CALLBACK.TARGET] = argument0[1];
	    // Assign callback handle to callback map
	    global.TGMS_MAP_CALLBACK[1][? global.TGMS_INDEX_CALLBACK] = _cb;
    
	    // IF event type exists...
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
	        // Add STATE and CALLBACK to event
	        qs_list_add(_event, true, _cb);
	        // Add event to events map
	        _events[1][? argument1] = _event;
	    }
    
	    // Return callback handle
	    return global.TGMS_INDEX_CALLBACK;
	}
}
