/// @description  TGMS_Tweener_Step_Optimised()
/// @function  TGMS_Tweener_Step_Optimised
function TGMS_Tweener_Step_Optimised() {

	//--------------------------
	// Manage Delta Timing
	//--------------------------
	// Store previous usable delta time format
	prevDeltaTime = deltaTime;
	// Update usable delta time format
	deltaTime = delta_time/1000000;

	// Let's prevent delta time from exhibiting sporadic behaviour, shall we?
	// IF the delta time is greater than the set max duration
	if (deltaTime > maxDelta)
	{
	    // IF delta time was already restored, set to max delta, else restore to previous delta time
	    if (deltaRestored) 
	    { 
	        deltaTime = maxDelta; 
	    } 
	    else 
	    { 
	        deltaTime = prevDeltaTime;
	        deltaRestored = true;
	    }
	}
	else
	{
	    deltaRestored = false;
	}

	// Assign time scales to array and cache as local var for tween step/delta optimisation
	timeScales[0] = timeScale;
	timeScales[1] = timeScale*deltaTime;
	var _systemTimeScales = timeScales;

	// Cache tweens list
	var _tweens = tweens;

	//---------------------------------
	// Process Main Update Loop
	//---------------------------------
	// IF the system is active
	if (isEnabled)
	{     
	    tick++;
    
	    // WHILE the system tick is greater than the set step update interval
	    while(tick >= updateInterval)
	    {   
	        tick -= updateInterval;
        
	        // IF system timescale isn't "paused"
	        if (timeScale != 0)
	        {
	            //----------------------------------------
	            // Process delay timers
	            //----------------------------------------
	            // Iterate through all delayed tweens
	            _index = -1;
	            repeat(qs_list_size(delayedTweens))
	            {
	                // Get tween from delayed tweens list
	                var _t = delayedTweens[| ++_index];
                
	                // IF tween set to be destroyed,
	                // remove tween from delay list and decrement iteration index
	                if (_t[TWEEN.STATE] == TWEEN_STATE.DESTROYED)
	                {
	                    qs_list_delete(delayedTweens, _index--);
	                }
	                else // Continue processing timer
	                {
	                    // Get delays list from tween
	                    var _delays = _t[TWEEN.DELAYS];
                    
	                    // Iterate through tween's delays
	                    var _dIndex = -1;
	                    repeat(qs_list_size(_delays))
	                    {
	                        // Get delay
	                        var _d = _delays[| ++_dIndex];
                        
	                        // IF tween instance exists AND delay is NOT destroyed
	                        with(_t[TWEEN.TARGET])
	                        { 
	                            if (_d[TWEEN_DELAY.STATE] != TWEEN_DELAY_STATE.CANCELED)
	                            {
	                                // Decrement delay timer
	                                _d[@ TWEEN_DELAY.DELAY] = _d[TWEEN_DELAY.DELAY] - abs(_t[TWEEN.TIME_SCALE]) * _d[TWEEN_DELAY.STATE] * _systemTimeScales[_t[TWEEN.DELTA]];
                                
	                                // IF the delay timer has expired
	                                if (_d[TWEEN_DELAY.DELAY] <= 0)
	                                {
	                                    // Mark for removal
	                                    _d[@ TWEEN_DELAY.STATE] = TWEEN_DELAY_STATE.CANCELED;
	                                    // Update tween property if set to do so
	                                    if (is_undefined(_d[TWEEN_DELAY.PROPERTY]) == false)
	                                    {
	                                        _t[@ TWEEN.PROPERTY] = _d[TWEEN_DELAY.PROPERTY];
	                                    }
	                                    // Play tween using values stored in delay data
	                                    TweenPlayOnce(_t[TWEEN.ID], _d[TWEEN_DELAY.EASE], _d[TWEEN_DELAY.START], _d[TWEEN_DELAY.DESTINATION], _d[TWEEN_DELAY.DURATION], _d[TWEEN_DELAY.PLAY_MODE]);
	                                    // Execute onFinish delay event
	                                    TGMS_ExecuteEvent(_d[TWEEN_DELAY.EVENTS], TWEEN_DELAY_EVENT.FINISH);
	                                }
	                            }
	                        }
                        
	                        // IF delay is marked for removal
	                        if (_d[TWEEN_DELAY.STATE] == TWEEN_DELAY_STATE.CANCELED)
	                        {
	                            // Remove delay data from scheduler and decrement loop index 
	                            qs_list_delete(_delays, _dIndex--);
	                            // Invalidate delay handle
	                            qs_map_delete(global.TGMS_MAP_DELAY, _d[TWEEN_DELAY.ID]);
                            
	                            // IF no more delays are attached to tween
	                            if (qs_list_empty(_delays))
	                            {
	                                // Destroy tween's delay list
	                                qs_list_destroy(_delays);
	                                // Remove delay list from delayed tweens list and decrement tween iteration index
	                                qs_list_delete(delayedTweens, _index--);
	                                // Invalidate tween's delay list
	                                _t[@ TWEEN.DELAYS] = -1;
                                
	                                // IF tween state not active AND is set to be destroyed, destroy it
	                                if (TweenGetState(_t[TWEEN.ID]) < TWEEN_STATE.PAUSED && _t[TWEEN.DESTROY])
	                                {
	                                    TweenDestroy(_t[TWEEN.ID]);
	                                }
	                            }
	                        }
	                    }
	                }
	            }
            
	            //--------------------------------------------------
	            // Process Tweens
	            //--------------------------------------------------
	            // Iterate through all tweens
	            var _index = -1; 
	            repeat(qs_list_size(_tweens))
	            {
	                // Get tween -- increment index
	                var _t = _tweens[1][| ++_index];
                
	                // Process tween with designated instance environment
	                with(_t[TWEEN.STATE])
	                {
	                    // Get updated time -- [DELTA] boolean selects between step/delta time scale
	                    var _time = _t[TWEEN.TIME] + _t[TWEEN.TIME_SCALE] * _systemTimeScales[_t[TWEEN.DELTA]];
                    
	                    // IF tween is within start/destination
	                    if (_time > 0 && _time < _t[TWEEN.DURATION])
	                    {
	                        // Assign updated time to tween
	                        _t[@ TWEEN.TIME] = _time;
                        
	                        // Assign eased value to set property type [script, array, undefined]
	                        if (is_real(_t[TWEEN.PROPERTY]))
	                        {
	                            TGMS_Optimised_PSet(_t[TWEEN.PROPERTY], TGMS_Optimised_Ease(_t[TWEEN.EASE], _time, _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]));
	                        }
	                        else if (is_array(_t[TWEEN.PROPERTY]))
	                        {
	                            var _property = _t[TWEEN.PROPERTY];
                            
	                            if (array_length_1d(_property) == 1)
	                            {
	                                _property[@ 0] = TGMS_Optimised_Ease(_t[TWEEN.EASE], _time, _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]);
	                            }
	                            else
	                            {
	                                TGMS_Optimised_PSetExt(_property[0], TGMS_Optimised_Ease(_t[TWEEN.EASE], _time, _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]), _property[1]);
	                            }
	                        }
	                    }
	                    else if (_t[TWEEN.TIME_SCALE] != 0)
	                    {
	                        switch(_t[TWEEN.PLAY_MODE])
	                        {
	                        case TWEEN_PLAY.ONCE:
	                            _t[@ TWEEN.STATE] = TWEEN_STATE.STOPPED;
	                            _t[@ TWEEN.TIME] = clamp(_time, 0, _t[TWEEN.DURATION]);
                            
	                            if (is_real(_t[TWEEN.PROPERTY]))
	                            {
	                                TGMS_Optimised_PSet(_t[TWEEN.PROPERTY], TGMS_Optimised_Ease(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]));
	                            }
	                            else if (is_array(_t[TWEEN.PROPERTY]))
	                            {
	                                var _property = _t[TWEEN.PROPERTY];
                                
	                                if (array_length_1d(_property) == 1)
	                                {
	                                    _property[@ 0] = TGMS_Optimised_Ease(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]);
	                                }
	                                else
	                                {
	                                    TGMS_Optimised_PSetExt(_property[0], TGMS_Optimised_Ease(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]), _property[1]);
	                                }
	                            }
                            
	                            TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EVENT.FINISH);
    
	                            if (_t[TWEEN.DESTROY] && _t[TWEEN.DELAYS] == -1)
	                            {   
	                                TweenDestroy(_t[TWEEN.ID]);
	                            }
	                        break;
                          
	                        case TWEEN_PLAY.PATROL:
	                            _t[@ TWEEN.TIME] = _t[TWEEN.DURATION] * 2 * (_time > 0) - _time;
                            
	                            if (is_real(_t[TWEEN.PROPERTY]))
	                            {
	                                TGMS_Optimised_PSet(_t[TWEEN.PROPERTY], TGMS_Optimised_Ease(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]));
	                            }
	                            else if (is_array(_t[TWEEN.PROPERTY]))
	                            {
	                                var _property = _t[TWEEN.PROPERTY];
                                
	                                if (array_length_1d(_property) == 1)
	                                {
	                                    _property[@ 0] = TGMS_Optimised_Ease(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]);
	                                }
	                                else
	                                {
	                                    TGMS_Optimised_PSetExt(_property[0], TGMS_Optimised_Ease(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]), _property[1]);
	                                }
	                            }
                            
	                            _t[@ TWEEN.DIRECTION] = -_t[TWEEN.DIRECTION];
	                            _t[@ TWEEN.TIME_SCALE] = -_t[TWEEN.TIME_SCALE];
	                            TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EVENT.BOUNCE);
	                        break;
                           
	                        case TWEEN_PLAY.BOUNCE:
	                            _t[@ TWEEN.TIME] = (_t[TWEEN.DURATION]*2-_time) * (_time > 0);
                            
	                            if (is_real(_t[TWEEN.PROPERTY]))
	                            {
	                                TGMS_Optimised_PSet(_t[TWEEN.PROPERTY], TGMS_Optimised_Ease(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]));
	                            }
	                            else if (is_array(_t[TWEEN.PROPERTY]))
	                            {
	                                var _property = _t[TWEEN.PROPERTY];
                                
	                                if (array_length_1d(_property) == 1)
	                                {
	                                    _property[@ 0] = TGMS_Optimised_Ease(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]);
	                                }
	                                else
	                                {
	                                    TGMS_Optimised_PSetExt(_property[0], TGMS_Optimised_Ease(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]), _property[1]);
	                                }
	                            }       
                            
	                            if (_time > 0)
	                            {
	                                _t[@ TWEEN.DIRECTION] = -_t[TWEEN.DIRECTION];
	                                _t[@ TWEEN.TIME_SCALE] = -_t[TWEEN.TIME_SCALE];
	                                TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EVENT.BOUNCE);
	                            }
	                            else
	                            {
	                                _t[@ TWEEN.STATE] = TWEEN_STATE.STOPPED;
	                                _t[@ TWEEN.TIME] = 0;
	                                TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EVENT.FINISH);
                                
	                                if (_t[TWEEN.DESTROY] && _t[TWEEN.DELAYS] == -1)
	                                {   
	                                    TweenDestroy(_t[TWEEN.ID]);
	                                }
	                            }
	                        break;
                        
	                        case TWEEN_PLAY.LOOP:
	                            if (_time > 0)
	                            {
	                                _t[@ TWEEN.TIME] = _time - _t[TWEEN.DURATION];
	                            }
	                            else
	                            {
	                                _t[@ TWEEN.TIME] = _t[TWEEN.DURATION] + _time;
	                            }
                                
	                            if (is_real(_t[TWEEN.PROPERTY]))
	                            {
	                                TGMS_Optimised_PSet(_t[TWEEN.PROPERTY], TGMS_Optimised_Ease(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]));
	                            }
	                            else if (is_array(_t[TWEEN.PROPERTY]))
	                            {
	                                var _property = _t[TWEEN.PROPERTY];
                                
	                                if (array_length_1d(_property) == 1)
	                                {
	                                    _property[@ 0] = TGMS_Optimised_Ease(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]);
	                                }
	                                else
	                                {
	                                    TGMS_Optimised_PSetExt(_property[0], TGMS_Optimised_Ease(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]), _property[1]);
	                                }
	                            }
                            
	                            TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EVENT.LOOP);
	                        break;
                        
	                        case TWEEN_PLAY.REPEAT:
	                            if (_time > 0)
	                            {
	                                _t[@ TWEEN.TIME] = _time - _t[TWEEN.DURATION];
	                                _t[@ TWEEN.START] = _t[TWEEN.START]+_t[TWEEN.CHANGE];
	                            }
	                            else
	                            {
	                                _t[@ TWEEN.TIME] = _t[TWEEN.DURATION] + _time;
	                                _t[@ TWEEN.START] = _t[TWEEN.START] - _t[TWEEN.CHANGE];
	                            }
                            
	                            if (is_real(_t[TWEEN.PROPERTY]))
	                            {
	                                TGMS_Optimised_PSet(_t[TWEEN.PROPERTY], TGMS_Optimised_Ease(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]));
	                            }
	                            else if (is_array(_t[TWEEN.PROPERTY]))
	                            {
	                                var _property = _t[TWEEN.PROPERTY];
                                
	                                if (array_length_1d(_property) == 1)
	                                {
	                                    _property[@ 0] = TGMS_Optimised_Ease(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]);
	                                }
	                                else
	                                {
	                                    TGMS_Optimised_PSetExt(_property[0], TGMS_Optimised_Ease(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]), _property[1]);
	                                }
	                            }   
  
	                            TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EVENT.REPEAT);
	                        break;
                        
	                        case TWEEN_PLAY.DESTROY_TARGET:
	                            _t[@ TWEEN.TARGET] = noone;
	                            instance_destroy();
	                        break;
                        
	                        default:
	                            show_error("Invalid Tween Play Mode! --> Reverting to TWEEN_PLAY.ONCE", false);
	                            TweenSetPlayMode(_t[TWEEN.ID], TWEEN_PLAY.ONCE);
	                        }
	                    }
	                }
	            }
	        }
	    }
	}

	//--------------------------------------------------
	// Event Cleaner
	//--------------------------------------------------
	if (qs_priority_size(eventCleaner))
	{
	    // Get event to check for cleaning
	    var _event = qs_priority_delete_min(eventCleaner);
        
	    // Cycle through all callbacks, except the new one -- make sure not to check event status index event[0]
	    var _cbIndex = qs_list_size(_event);
	    repeat(_cbIndex-1)
	    {
	        var _cb = _event[1][| --_cbIndex];
	        var _target = _cb[TWEEN_CALLBACK.TARGET];
        
	        if (instance_exists(_target) == false)
	        {
	            instance_activate_object(_target);
            
	            if (instance_exists(_target))
	            {
	                instance_deactivate_object(_target);   
	            }
	            else
	            {
	                // Invalidate callback handle and remove callback from event list
	                qs_map_delete(global.TGMS_MAP_CALLBACK, _cb[TWEEN_CALLBACK.ID]);
	                qs_list_delete(_event, _cbIndex);
	            }
	        }
	    }
	}

	//--------------------------------------------------
	// Passive Tween Cleaner
	//--------------------------------------------------
	repeat(min(autoCleanIterations, autoCleanIndex, qs_list_size(_tweens)))
	{   
	    // Cache tween
	    var _t = _tweens[1][| --autoCleanIndex];
    
	    // IF tween target does not exist
	    if (instance_exists(_t[TWEEN.TARGET]) == false)
	    {
	        // IF tween is set for destruction
	        if (_t[TWEEN.TARGET] == noone)
	        {
	            // Remove tween from tweens list
	            qs_list_delete(_tweens, autoCleanIndex);
            
	            // IF tween events are valid
	            if (_t[TWEEN.EVENTS] != -1)
	            {
	                // Get events data map and first key
	                var _events = _t[TWEEN.EVENTS];
	                var _key = qs_map_find_first(_events);
                
	                // Cycle through all events
	                repeat(qs_map_size(_events))
	                {
	                    // Destroy event list and get next events key
	                    qs_list_destroy(_events[1][? _key]);
	                    _key = qs_map_find_next(_events, _key);
	                }
                
	                qs_map_destroy(_events);
	            }
            
	            // IF tween delays are valid, destroy delays list
	            if (_t[TWEEN.DELAYS] != -1)
	            {
	                qs_list_destroy(_t[TWEEN.DELAYS]);
	            }
	        }
	        else
	        {
	            instance_activate_object(_t[TWEEN.TARGET]);
            
	            // Put instance back to deactivated state if it now exists
	            // ELSE handle tween destruction
	            if (instance_exists(_t[TWEEN.TARGET]))
	            {
	                instance_deactivate_object(_t[TWEEN.TARGET]);
	            }
	            else
	            {
	                // Remove tween from tweens list
	                qs_list_delete(_tweens, autoCleanIndex);
	                // Invalidate tween handle
	                qs_map_delete(global.TGMS_MAP_TWEEN, _t[TWEEN.ID]);
	                // Delete simple tween data
	                qs_map_delete(simpleTweens, _t[TWEEN.SIMPLE_KEY]);
	                // Set tween state as destroyed
	                _t[@ TWEEN.STATE] = TWEEN_STATE.DESTROYED;
                
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
                        
	                        // Invalidate callback handles
	                        var _cbIndex = 0;
	                        repeat(qs_list_size(_event)-1)
	                        {
	                            var _cb = _event[1][| ++_cbIndex];
	                            qs_map_delete(global.TGMS_MAP_CALLBACK, _cb[2]);
	                        }
                        
	                        // Destroy event list
	                        qs_list_destroy(_event);
	                        // Find key for next event
	                        _key = qs_map_find_next(_events, _key);
	                    }
                    
	                    // Destroy events map
	                    qs_map_destroy(_events);
	                }
                
	                // Destroy tween delays
	                if (_t[TWEEN.DELAYS] != -1)
	                {
	                    // Cache tween delays
	                    var _delays = _t[TWEEN.DELAYS];
                    
	                    // Invalidiate delay handles
	                    var _dIndex = -1;
	                    repeat(qs_list_size(_delays))
	                    {
	                        var _d = _delays[| ++_dIndex];
	                        qs_map_delete(global.TGMS_MAP_DELAY, _d[8]);
	                    }
                    
	                    // Destroy delay list
	                    qs_list_destroy(_delays);
	                }
	            }
	        }
	    }
	}

	// Place auto clean index to size of tweens list if below or equal to 0
	if (autoCleanIndex <= 0)
	{
	    autoCleanIndex = qs_list_size(_tweens);
	}




}
