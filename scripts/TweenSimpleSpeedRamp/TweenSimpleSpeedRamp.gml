/// @description  TweenSimpleSpeedRamp(speed1,speed2,dur,ease)
/// @function  TweenSimpleSpeedRamp
/// @param speed1
/// @param speed2
/// @param dur
/// @param ease
function TweenSimpleSpeedRamp(argument0, argument1, argument2, argument3) {

	var _key = id+TWEEN_SIMPLE.SPEED_RAMP;
	var _sharedTweener = SharedTweener();
	var _tween;

	if (ds_map_exists(_sharedTweener.simpleTweens, _key) == false)
	{
	    _tween = global.TGMS_MAP_TWEEN[1][? TweenCreate(id, speed__, false)];
	    _tween[@ TWEEN.SIMPLE_KEY] = _key;
	    _tween[@ TWEEN.DESTROY] = true;
	    _sharedTweener.simpleTweens[? _key] = _tween;
	}
	else
	{
	    _tween = _sharedTweener.simpleTweens[? _key];
	}

	_tween[@ TWEEN.DELTA] = _sharedTweener.simpleTweensUseDelta;
	TweenPlayOnce(_tween[TWEEN.ID], argument3, argument0, argument1, argument2);
	return _tween[TWEEN.ID];



}
