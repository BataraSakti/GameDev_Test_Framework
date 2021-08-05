/// @description  TweenPlayOnceDelay(tween,delay[,ease,start,dest,dur])
/// @function  TweenPlayOnceDelay
/// @param tween
/// @param delay[
/// @param ease
/// @param start
/// @param dest
/// @param dur]
function TweenPlayOnceDelay() {
	// TweenPlayOnceDelay(tween,delay[,ease,start,dest,dur],**->mode)

	if (argument[0])
	{
	    // Get tween
	    var _t = global.TGMS_MAP_TWEEN[1][? argument[0]];
	    // Get default tween delay
	    var _d = global.TGMS_DelayDefault;
    
	    // Assign tween to tween delay -- creates new array
	    _d[TWEEN_DELAY.TWEEN] = _t;
	    // Set delay time
	    _d[TWEEN_DELAY.DELAY] = argument[1];
    
	    if (argument_count >= 6)
	    {
	        _d[TWEEN_DELAY.EASE] = argument[2];
	        _d[TWEEN_DELAY.START] = argument[3];
	        _d[TWEEN_DELAY.DESTINATION] = argument[4];
	        _d[TWEEN_DELAY.DURATION] = argument[5]; 
        
	        if (argument_count == 7)
	        {
	            _d[TWEEN_DELAY.PLAY_MODE] = argument[6];
	        }
	    }
	    else
	    {
	        _d[TWEEN_DELAY.EASE] = _t[TWEEN.EASE];
	        _d[TWEEN_DELAY.DURATION] = _t[TWEEN.DURATION];
	        _d[TWEEN_DELAY.START] = _t[TWEEN.START];
	        _d[TWEEN_DELAY.DESTINATION] = _t[TWEEN.START] + _t[TWEEN.CHANGE];

	        if (argument_count == 3)
	        {
	            _d[TWEEN_DELAY.PLAY_MODE] = argument[2];
	        }
	    }
    
	    // Assign index delay handle
	    _d[TWEEN_DELAY.ID] = ++global.TGMS_INDEX_DELAY;
    
	    // IF delay list doesn't exist...
	    if (_t[TWEEN.DELAYS] == -1)
	    {
	        // ... Create a new one
	        _delayList = qs_list_create();
	        // Assign delay list reference to tween
	        _t[@ TWEEN.DELAYS] = _delayList;
	        // Add delay to main delay list
	        qs_list_add(SharedTweener().delayedTweens, _t);
	    }
    
	    // Add delay to tween's delays list
	    qs_list_add(_t[TWEEN.DELAYS], _d);
    
	    // Assign index handle to delays map
	    global.TGMS_MAP_DELAY[1][? global.TGMS_INDEX_DELAY] = _d;
    
	    // Return delay handle index
	    return global.TGMS_INDEX_DELAY;
	}



}
