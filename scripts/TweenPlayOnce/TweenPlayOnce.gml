/// @description  TweenPlayOnce(tween,[ease,start,dest,dur])
/// @function  TweenPlayOnce
/// @param tween
/// @param [ease
/// @param start
/// @param dest
/// @param dur]
function TweenPlayOnce() {
	// TweenPlayOnce(tween,[ease,start,dest,dur],**->mode)

	if (argument[0])
	{
	    var _t = global.TGMS_MAP_TWEEN[1][? argument[0]];
     
		 if (!is_array(_t)){
			show_debug("TweenPlayOnce tween is not array");
			exit;
		 }
	 
	    _t[@ TWEEN.PLAY_MODE] = TWEEN_PLAY.ONCE;
	    _t[@ TWEEN.TIME] = 0;
	    _t[@ TWEEN.TIME_SCALE] = abs(_t[TWEEN.TIME_SCALE]);
	    _t[@ TWEEN.STATE] = _t[TWEEN.TARGET];
	    _t[@ TWEEN.DIRECTION] = 1;
    
	    if (argument_count == 2)
	    {
	        _t[@ TWEEN.PLAY_MODE] = argument[1];
	    }
	    else
	    if (argument_count >= 5)
	    {
	        _t[@ TWEEN.START] = argument[2];
	        _t[@ TWEEN.DURATION] = argument[4];
	        _t[@ TWEEN.EASE] = argument[1];
	        _t[@ TWEEN.CHANGE] = argument[3]-_t[@ TWEEN.START];//argument[2]; 
        
	        if (argument_count == 6)
	        {
	            _t[@ TWEEN.PLAY_MODE] = argument[5];
	        }
	    }
    
	    // Determine tween property type
	    if (is_real(_t[TWEEN.PROPERTY]))
	    {
	        with(_t[TWEEN.TARGET]) script_execute(_t[TWEEN.PROPERTY], _t[TWEEN.START]);
	    }
	    else if (is_array(_t[TWEEN.PROPERTY]))
	    {
	        var _property = _t[TWEEN.PROPERTY];
        
	        if (array_length(_property) == 1)
	        {
	            _property[@ 0] = _t[TWEEN.START];
	        }
	        else
	        {
	            script_execute(_property[0], _t[TWEEN.START], _property[1]);
	        }
	    }
    
	    // Execute onPlay event
	    TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EVENT.PLAY);
	}



}
