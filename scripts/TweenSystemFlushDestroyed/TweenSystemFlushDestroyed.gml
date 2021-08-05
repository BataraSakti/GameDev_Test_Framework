/// @description  TweenSystemFlushDestroyed()
/// @function  TweenSystemFlushDestroyed
function TweenSystemFlushDestroyed() {
	/*
	    Overrides passive memory manager by immediately removing
	    all destroyed tweens from the system
	*/

	with(SharedTweener())
	{
	    // Make sure auto clean index is reset after flushing system
	    autoCleanIndex = 0;
    
	    var _tweens = tweens;
	    var _index = qs_list_size(_tweens);
    
	    repeat(qs_list_size(_tweens))
	    {   
	        var _t = _tweens[1][| --_index];
	        var _target = _t[TWEEN.TARGET];
        
	        // Check to see if target no longer exists -- Proceed with attempting to destroy tween if so
	        if (instance_exists(_target) == false)
	        { 
	            // Attempt to reactivate instance if it has simply been deactivated
	            instance_activate_object(_target);
            
	            // IF instance still exists, put target back in deactivated state 
	            // ELSE proceed with destroying tween
	            if (instance_exists(_target))
	            {
	                instance_deactivate_object(_target);
	            }
	            else
	            {
	                // Delete simple tween data
	                qs_map_delete(simpleTweens, _t[TWEEN.SIMPLE_KEY]); 
	                // Invalidate tween handle
	                qs_map_delete(global.TGMS_MAP_TWEEN, _t[TWEEN.ID]);
	                // Remove tween from tweens list 
	                qs_list_delete(_tweens, _index);
                
	                // Destroy tween delays
	                if (_t[TWEEN.DELAYS] != -1)
	                {
	                    // Cache tween delays
	                    var _delays = _t[TWEEN.DELAYS];
                    
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
	                if (_t[TWEEN.EVENTS] != -1)
	                {
	                    // Cache events
	                    var _events = _t[TWEEN.EVENTS];
	                    // Find key to first event
	                    var _key = qs_map_find_first(_events);
                    
	                    // Cycle through and destroy all events
	                    repeat(qs_map_size(_events))
	                    {
	                        // Cache event
	                        var _event = _events[1][? _key];
                        
	                        // Cycle through all event callbacks...
	                        var _cbIndex = 0;
	                        repeat(qs_list_size(_event)-1)
	                        {
	                            // Invalidate callback handle
	                            var _cb = _event[1][| ++_cbIndex];
	                            qs_map_delete(global.TGMS_MAP_CALLBACK, _cb[2]);
	                        }
                        
	                        // Destroy event
	                        qs_list_destroy(_event);
	                        // Find key for next event
	                        _key = qs_map_find_next(_events, _key);
	                    } 
                    
	                    // Destroy events map
	                    qs_map_destroy(_events);
	                }
	            }
	        }
	    }
	}



}
