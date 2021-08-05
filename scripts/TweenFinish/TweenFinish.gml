/// @description  TweenFinish(tween,call_event)
/// @function  TweenFinish
/// @param tween
/// @param call_event
function TweenFinish(argument0, argument1) {

	if (argument0)
	{
	    var _t = global.TGMS_MAP_TWEEN[1][? argument0];
	    if (!is_array(_t)){
			exit;
		}
	    if (_t[TWEEN.STATE] >= TWEEN_STATE.PAUSED)
	    {    
	        switch(_t[TWEEN.PLAY_MODE])
	        {
	        case TWEEN_PLAY.ONCE:
	            _t[@ TWEEN.STATE] = TWEEN_STATE.STOPPED;
	            _t[@ TWEEN.TIME] = _t[TWEEN.DURATION];
            
	            // Assign eased value to set property type [script, array, undefined]
	            if (is_real(_t[TWEEN.PROPERTY]))
	            {
	                script_execute(_t[TWEEN.PROPERTY], script_execute(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]));
	            }
	            else if (is_array(_t[TWEEN.PROPERTY]))
	            {
	                var _property = _t[TWEEN.PROPERTY];
                
	                if (array_length(_property) == 1)
	                {
	                    _property[@ 0] = script_execute(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]);
	                }
	                else
	                {
	                    script_execute(_property[0], script_execute(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]), _property[1]);
	                }
	            }
	        break;    
        
	        case TWEEN_PLAY.BOUNCE: 
	            _t[@ TWEEN.STATE] = TWEEN_STATE.STOPPED;
	            _t[@ TWEEN.TIME] = 0;
            
	            // Assign eased value to set property type [script, array, undefined]
	            if (is_real(_t[TWEEN.PROPERTY]))
	            {
	                script_execute(_t[TWEEN.PROPERTY], script_execute(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]));
	            }
	            else if (is_array(_t[TWEEN.PROPERTY]))
	            {
	                var _property = _t[TWEEN.PROPERTY];
                
	                if (array_length(_property) == 1)
	                {
	                    _property[@ 0] = script_execute(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]);
	                }
	                else
	                {
	                    script_execute(_property[0], script_execute(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]), _property[1]);
	                }
	            }
	        break;
        
	        default: 
	            exit;
	        }
        
	        // Execute finish event IF set to do so
	        if (argument1) 
	        {
	            TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EVENT.FINISH);
	        }
        
	        // IF tween is set to be destroyed
	        if (_t[TWEEN.DESTROY] && _t[TWEEN.DELAYS] == -1)
	        {   
	            TweenDestroy(_t[TWEEN.ID]);
	        }
	    }
	}



}
