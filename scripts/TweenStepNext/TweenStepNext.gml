/// @description  TweenStepPrevious(tween)
/// @function  TweenStepPrevious
/// @param tween
function TweenStepIncrement(tween, inc_next) {
	if (tween) {
	    var _t = global.TGMS_MAP_TWEEN[1][? tween];
    
	    // Process tween with designated instance environment -- Won't execute if instance deactivated or destroyed
	    with(_t[TWEEN.TARGET]) {
	        // Cache shared tweener
	        var _sharedTweener = SharedTweener();
	        // Cache time scales
	        var _systemTimeScales = _sharedTweener.timeScales;
        
	        if (_sharedTweener.timeScale != 0) {
				if(inc_next) { // Get updated time -- [DELTA] boolean selects between step/delta time scale
					var _time = _t[TWEEN.TIME] + _t[TWEEN.TIME_SCALE] * _systemTimeScales[_t[TWEEN.DELTA]];
				} else {
					var _time = _t[TWEEN.TIME] - _t[TWEEN.TIME_SCALE] * _systemTimeScales[_t[TWEEN.DELTA]];
				}
            
	            if (_time > 0 && _time < _t[TWEEN.DURATION]) {
	                _t[@ TWEEN.TIME] = _time;
                
	                if (is_real(_t[TWEEN.PROPERTY])) {
	                    script_execute(_t[TWEEN.PROPERTY], script_execute(_t[TWEEN.EASE], _time, _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]));
	                } else if (is_array(_t[TWEEN.PROPERTY])) {
	                    var _property = _t[TWEEN.PROPERTY];
	                    _property[@ 0] = script_execute(_t[TWEEN.EASE], _time, _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]);
	                }
	            } else if (_t[TWEEN.TIME_SCALE] != 0) {
	                // Update tween based on playmode type
	                switch(_t[TWEEN.PLAY_MODE]) {
	                case TWEEN_PLAY.ONCE:
	                    // Set tween state as STOPPED
	                    _t[@ TWEEN.STATE] = TWEEN_STATE.STOPPED;
	                    // Set time to duration
	                    _t[@ TWEEN.TIME] = clamp(_time, 0, _t[TWEEN.DURATION]);
                    
	                    // Update eased value using set property type
	                    if (is_real(_t[TWEEN.PROPERTY])) {
	                        script_execute(_t[TWEEN.PROPERTY], script_execute(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]));
	                    } else if (is_array(_t[TWEEN.PROPERTY])) {
	                        var _property = _t[TWEEN.PROPERTY];
	                        _property[@ 0] = script_execute(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]);
	                    }
                    
	                    // Execute FINISH event
	                    TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EVENT.FINISH);
                    
	                    // IF tween is set to be destroyed
	                    if (_t[TWEEN.DESTROY] && _t[TWEEN.DELAYS] == -1) {   
	                        TweenDestroy(_t[TWEEN.ID]);
	                    }
	                break;
                    
	                case TWEEN_PLAY.PATROL:
	                    // Update time
	                    _t[@ TWEEN.TIME] = _t[TWEEN.DURATION]*2*(_time > 0)-_time;
                    
	                    // Update eased value using set property type
	                    if (is_real(_t[TWEEN.PROPERTY])) {
	                        script_execute(_t[TWEEN.PROPERTY], script_execute(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]));
	                    } else if (is_array(_t[TWEEN.PROPERTY])) {
	                        var _property = _t[TWEEN.PROPERTY];
	                        _property[@ 0] = script_execute(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]);
	                    }
                    
	                    // Reverse direction
	                    _t[@ TWEEN.DIRECTION] = -_t[TWEEN.DIRECTION];
	                    // Reverse time scale
	                    _t[@ TWEEN.TIME_SCALE] = -_t[TWEEN.TIME_SCALE];
	                    // Execute bounce event
	                    TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EVENT.BOUNCE);
	                break;
                    
	                case TWEEN_PLAY.BOUNCE:
	                    // IF time larger than 0, bounce the tween back to start
	                    // ELSE have the tween finish
	                    _t[@ TWEEN.TIME] = (_t[TWEEN.DURATION]*2-_time) * (_time > 0);
                    
	                    // Update eased value using set property type
	                    if (is_real(_t[TWEEN.PROPERTY])) {
	                        script_execute(_t[TWEEN.PROPERTY], script_execute(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]));
	                    } else if (is_array(_t[TWEEN.PROPERTY])) {
	                        var _property = _t[TWEEN.PROPERTY];
	                        _property[@ 0] = script_execute(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]);
	                    }
                    
	                    if (_time > 0) {
	                        // Reverse tween direction
	                        _t[@ TWEEN.DIRECTION] = -_t[TWEEN.DIRECTION];
	                        // Reverse tween time scale
	                        _t[@ TWEEN.TIME_SCALE] = -_t[TWEEN.TIME_SCALE];
	                        // Execute onBounce event
	                        TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EVENT.BOUNCE);
	                    } else {
	                        // Set tween state as stopped
	                        _t[@ TWEEN.STATE] = TWEEN_STATE.STOPPED;
	                        // Clamp tween's time
	                        _t[@ TWEEN.TIME] = 0;
	                        // Execute FINISH event
	                        TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EVENT.FINISH);
                        
	                        // Destroy tween IF designated too when finished
	                        // IF tween is set to be destroyed
	                        if (_t[TWEEN.DESTROY] && _t[TWEEN.DELAYS] == -1) {   
	                            TweenDestroy(_t[TWEEN.ID]);
	                        }
	                    }
	                break;
                    
	                case TWEEN_PLAY.LOOP:
	                    // IF tween's time is positive, jump to start
	                    // ELSE jump to the end
	                    if (_time > 0) {
	                        _t[@ TWEEN.TIME] = _time - _t[TWEEN.DURATION];
	                    } else {
	                        _t[@ TWEEN.TIME] = _t[TWEEN.DURATION] + _time;
	                    }
                        
	                    if (is_real(_t[TWEEN.PROPERTY])) {
	                        script_execute(_t[TWEEN.PROPERTY], script_execute(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]));
	                    } else if (is_array(_t[TWEEN.PROPERTY])) {
	                        var _property = _t[TWEEN.PROPERTY];
	                        _property[@ 0] = script_execute(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]);
	                    }
                    
	                    // Execute onLoop event
	                    TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EVENT.LOOP);
	                break;
                   
	                case TWEEN_PLAY.REPEAT:
	                    // IF tween's time is positive, jump to start
	                    // ELSE jump to the end
	                    if (_time > 0) {
	                        // Set tween time
	                        _t[@ TWEEN.TIME] = _time - _t[TWEEN.DURATION];
	                        // Set new start
	                        _t[@ TWEEN.START] = _t[TWEEN.START]+_t[TWEEN.CHANGE];
	                    } else {
	                        // Set tween time
	                        _t[@ TWEEN.TIME] = _t[TWEEN.DURATION] + _time;
	                        // Set new start
	                        _t[@ TWEEN.START] = _t[TWEEN.START] - _t[TWEEN.CHANGE];
	                    }
                    
	                    // IF script property setter
	                    // ELSE IF array property setter
	                    if (is_real(_t[TWEEN.PROPERTY])) {
	                        script_execute(_t[TWEEN.PROPERTY], script_execute(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]));
	                    } else if (is_array(_t[TWEEN.PROPERTY])) {
	                        var _property = _t[TWEEN.PROPERTY];
	                        _property[@ 0] = script_execute(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]);
	                    }    

	                    // Execute onRepeat event
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

/// @description  TweenStepNext(tween)
/// @function  TweenStepNext
/// @param tween
function TweenStepNext(tween) {
	TweenStepIncrement(tween, true);	
}

/// @description  TweenStepPrevious(tween)
/// @function  TweenStepPrevious
/// @param tween
function TweenStepPrevious(tween) {
	TweenStepIncrement(tween, false);	
}