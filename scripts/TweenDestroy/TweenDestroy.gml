/// @description  TweenDestroy(tween);
/// @function  TweenDestroy
/// @param tween
function TweenDestroy(argument0) {
	// return null

	if (argument0)
	{
	    // Get tween data
	    var _t = global.TGMS_MAP_TWEEN[1][? argument0];
		if (!is_array(_t)){
			show_debug("TweenDestroy _t is not array");
			exit;
		}
		
	    // Invalidate tween handle
		if (qs_map_exists(global.TGMS_MAP_TWEEN, _t[TWEEN.ID])){
			qs_map_delete(global.TGMS_MAP_TWEEN, _t[TWEEN.ID]);
		}
		
	    // Delete simple tween data
		if(instance_exists(SharedTweener())){
			with(SharedTweener()){
				if(qs_exists(simpleTweens, ds_type_map)){
					if (qs_map_exists(simpleTweens, _t[TWEEN.SIMPLE_KEY])){
						qs_map_delete(simpleTweens, _t[TWEEN.SIMPLE_KEY]);
					}
				}else{
					show_debug("DUD there is no ds_map - simpleTweens");
				}
			}
		}
		
	    // Destroy target if set to do so
	    if (_t[TWEEN.DESTROY] == 2)
	    { 
			// Get target to destroy
	        var _target = _t[TWEEN.TARGET];
	        // Attempt to destroy target
	        with(_target) instance_destroy();
	        // Attempt to activate target by chance it was deactivated
	        instance_activate_object(_target);
        
	        // IF instance now exists -- designate it for destruction in tweener step
	        if (instance_exists(_target))
	        {
	            _target.visible = false;
	            _t[@ TWEEN.TARGET] = SharedTweener();
	            _t[@ TWEEN.PLAY_MODE] = TWEEN_PLAY.DESTROY_TARGET;
	            _t[@ TWEEN.DURATION] = 0;
	        }
	    }
	    else
	    {
	        // Invalidate target instance and active target instance
	        _t[@ TWEEN.TARGET] = noone;
	    }
    
	    // Set as destroyed and nullify self reference
	    _t[@ TWEEN.STATE] = TWEEN_STATE.DESTROYED;
	    _t[@ TWEEN.ID] = 0;
    
	    // IF tween events map exists
	    if (_t[TWEEN.EVENTS] != -1)
	    {
			// Cache events and find first event key
	        var _events = _t[TWEEN.EVENTS];
			
			if(!is_undefined(_events) && qs_exists(_events, ds_type_map)){
		        var _key = qs_map_find_first(_events);
        
		        // Iterate events
		        repeat(qs_map_size(_events))
		        {
		            // Get event
		            var _event = _events[1][? _key];
		            show_debug("TweenDestroy _event: "+string(_event));
		            // Iterate through event callbacks
		            var _cbIndex = 0;
		            repeat(qs_list_size(_event)-1)
		            {
		                // Get callback and invalidate handle
		                var _cb = _event[1][| ++_cbIndex];
						if(is_undefined(_cb) || !is_array(_cb)) {
							var st = "Tween Destroy Exploded _cb: " + string(_cb) + " _cbIndex: " + 
								string(_cbIndex) + " list size: " + string(qs_list_size(_event));
								show_debug(st);
								//assert(st);
						} else {
							if(qs_map_exists(global.TGMS_MAP_CALLBACK, _cb[TWEEN_CALLBACK.ID])){
								qs_map_delete(global.TGMS_MAP_CALLBACK, _cb[TWEEN_CALLBACK.ID]);
							}
						}
		            }
            
		            // Find key for next event
		            _key = qs_map_find_next(_events, _key);
		        }
			}else{
				show_debug("DUD _event is undefined");
			}
	    }
    
	    // IF tween delays list exists
	    if (_t[TWEEN.DELAYS] != -1)
	    {
			// Cache tween delays
	        var _delays = _t[TWEEN.DELAYS];
        
	        // Iterate through delays
	        var _dIndex = -1;
			if(!is_undefined(_delays)){
		        repeat(qs_list_size(_delays))
		        {
		            // Get delay and invalidate handle
		            var _delay = _delays[1][| ++_dIndex];
					if(qs_map_exists(global.TGMS_MAP_DELAY, _delay[TWEEN_DELAY.ID])){
						qs_map_delete(global.TGMS_MAP_DELAY, _delay[TWEEN_DELAY.ID]);
					}
		        }
			}
	    }
	}



}
