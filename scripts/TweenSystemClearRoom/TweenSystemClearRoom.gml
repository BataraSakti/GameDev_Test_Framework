/// @description  TweenSystemClearRoom(room)
/// @function  TweenSystemClearRoom
/// @param room
function TweenSystemClearRoom(argument0) {
	// Clears persistent room's tween data

	var _sharedTweener = SharedTweener();
	var _simpleTweens = _sharedTweener.simpleTweens;
	var _pRoomTweens = _sharedTweener.pRoomTweens;
	var _pRoomDelays = _sharedTweener.pRoomDelays;
	var _key = argument0;

	// Destroy persistent delays queue and remove map key
	if (qs_map_exists(_pRoomDelays, _key))
	{
	    qs_queue_destroy(qs_map_find_value(_pRoomDelays, _key));
	    qs_map_delete(_pRoomDelays, _key);
	}

	// Destroy tweens for persistent room
	if (qs_map_exists(_pRoomTweens, _key))
	{
	    var _queue = qs_map_find_value(_pRoomTweens, _key);
    
	    repeat(qs_queue_size(_queue))
	    {
	        var _tween = qs_queue_dequeue(_queue);
	        {   
	            // Delete simple tween data
	            qs_map_delete(_simpleTweens, _tween[TWEEN.SIMPLE_KEY]);
	            // Invalidate tween handle
	            qs_map_delete(global.TGMS_MAP_TWEEN, _tween[TWEEN.ID]);
            
	            // Destroy tween delays
	            if (_tween[TWEEN.DELAYS] != -1)
	            {
	                // Cache tween delays
	                var _delays = _tween[TWEEN.DELAYS];
                
	                // Invalidiate delay handles
	                var _dIndex = -1;
	                repeat(qs_list_size(_delays))
	                {
	                    var _delay = _delays[| ++_dIndex];
	                    qs_map_delete(global.TGMS_MAP_DELAY, _delay[TWEEN_DELAY.ID]);
	                }
                
	                // Destroy delay list
	                qs_list_destroy(_delays);
	            }
            
	            // Destroy tween events if events map exists
	            if (_tween[TWEEN.EVENTS] != -1)
	            {
	                // Cache events
	                var _events = _tween[TWEEN.EVENTS];
	                // Find key to first event
	                var _key = qs_map_find_first(_events);
                
	                // Cycle through and destroy all events
	                repeat(qs_map_size(_events))
	                {
	                    // Cache event
	                    var _event = _events[1][? _key];
                    
	                    // Invalidate callback handles
	                    var _cbIndex = 0;
	                    repeat(qs_list_size(_event)-1)
	                    {
	                        var _cb = _event[1][| ++_cbIndex];
	                        qs_map_delete(global.TGMS_MAP_CALLBACK, _cb[TWEEN_CALLBACK.ID]);
	                    }
                    
	                    // Destroy event list
	                    qs_list_destroy(_event);
	                    // Find key for next event
	                    _key = qs_map_find_next(_events, _key);
	                }
                
	                // Destroy events map
	                qs_map_destroy(_events);
	            }
	        }
	    }
    
	    qs_queue_destroy(_queue);
	    qs_map_delete(_pRoomTweens, _key);
	}



}
