/// @description  TweenCopy(tween,target)
/// @function  TweenCopy
/// @param tween
/// @param target
function TweenCopy(argument0, argument1) {
	/*
	    Returns a copy of supplied tween -- Events and delays are invalidated
	*/

	if (argument0)
	{
	    // Get source tween
	    var _t = global.TGMS_MAP_TWEEN[1][? argument0];
	    // Assign target -- also creates new copy of source tween
	    _t[TWEEN.TARGET] = argument1;
	    // Clear events
	    _t[TWEEN.EVENTS] = -1;
	    // Invalidate delay list
	    _t[TWEEN.DELAYS] = -1;
    
	    // IF tween is playing, set active target
	    if (_t[TWEEN.STATE] >= 0)
	    {
	        _t[TWEEN.STATE] = _t[TWEEN.TARGET];
	    }
    
	    // Store tween index handle inside tween
	    _t[TWEEN.ID] = ++global.TGMS_INDEX_TWEEN;
	    // Add tween index handle to global tweens map
	    global.TGMS_MAP_TWEEN[1][? global.TGMS_INDEX_TWEEN] = _t;
	    // Add new tween to tweening list
	    qs_list_add(SharedTweener().tweens, _t);
	    // Return new tween index handle
	    return global.TGMS_INDEX_TWEEN;
	}



}
