/// @description  TweenCreate(target,property,delta,[ease,start,dest,dur])
/// @function  TweenCreate
/// @param target
/// @param property
/// @param delta
/// @param [ease
/// @param start
/// @param dest
/// @param dur]
function TweenCreate() {

	var _t = global.TGMS_TweenDefault;

	// Set tween properties -- creates new array from copy
	_t[TWEEN.TARGET] = argument[0];
	_t[TWEEN.PROPERTY] = argument[1];
	_t[TWEEN.DELTA] = argument[2];

	// Set defined tween values
	if (argument_count == 7)
	{
	    _t[TWEEN.EASE] = argument[3];
	    _t[TWEEN.START] = argument[4];
	    _t[TWEEN.CHANGE] = argument[5]-_t[TWEEN.START];//argument[4];
	    _t[TWEEN.DURATION] = argument[6];
	}

	// Store tween index handle inside tween
	_t[TWEEN.ID] = ++global.TGMS_INDEX_TWEEN;
	// Assign tween handle to map
	global.TGMS_MAP_TWEEN[1][? global.TGMS_INDEX_TWEEN] = _t;
	// Add new tween to tweening list
	qs_list_add(SharedTweener().tweens, _t);
	// Return tween index handle
	return global.TGMS_INDEX_TWEEN;



}
