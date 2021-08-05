/// @description  TweenFire(target,property,delta,ease,start,dest,dur)
/// @function  TweenFire
/// @param target
/// @param property
/// @param delta
/// @param ease
/// @param start
/// @param dest
/// @param dur
function TweenFire() {
	// TweenFire(target,property,delta,ease,start,dest,dur,**->mode)

	// Copy default tween data
	var _t = global.TGMS_TweenDefault;

	_t[TWEEN.TARGET] = argument[0];
	_t[TWEEN.PROPERTY] = argument[1];
	_t[TWEEN.DELTA] = argument[2];
	_t[TWEEN.EASE] = argument[3];
	_t[TWEEN.START] = argument[4];
	_t[TWEEN.DURATION] = argument[6]; 
	_t[TWEEN.CHANGE] = argument[5]-_t[TWEEN.START];
	_t[TWEEN.DESTROY] = 1;
	_t[TWEEN.TIME] = 0; 
	_t[TWEEN.STATE] = argument[0];

	if (argument_count == 8)
	{
	    _t[TWEEN.PLAY_MODE] = argument[7];
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

	_t[TWEEN.ID] = ++global.TGMS_INDEX_TWEEN;
	global.TGMS_MAP_TWEEN[1][? global.TGMS_INDEX_TWEEN] = _t;
	qs_list_add(SharedTweener().tweens, _t);

	return global.TGMS_INDEX_TWEEN;



}
