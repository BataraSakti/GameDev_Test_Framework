/// @description  TweenSetTime(tween,time)
/// @function  TweenSetTime
/// @param tween
/// @param time
function TweenSetTime(argument0, argument1) {

	if (argument0)
	{
	    var _t = global.TGMS_MAP_TWEEN[1][? argument0];
	
		if (!is_array(_t)){
			exit;
		}
    
	    // Assign new time value
	    _t[@ TWEEN.TIME] = argument1;
    
	    if (_t[TWEEN.DURATION] != 0)
	    {
	        with(_t[TWEEN.TARGET])
	        {    
	            // Determine tween property type
	            if (is_real(_t[TWEEN.PROPERTY]))
	            {
	                script_execute(_t[TWEEN.PROPERTY], script_execute(_t[TWEEN.EASE], argument1, _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]));
	            }
	            else if (is_array(_t[TWEEN.PROPERTY]))
	            {
	                var _property = _t[TWEEN.PROPERTY];
                
	                if (array_length_1d(_property) == 1)
	                {
	                    _property[@ 0] = script_execute(_t[TWEEN.EASE], argument1, _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]);
	                }
	                else
	                {
	                    script_execute(_property[0], script_execute(_t[TWEEN.EASE], argument1, _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]), _property[1]);
	                }
	            }
	        }
	    }
	}



}
