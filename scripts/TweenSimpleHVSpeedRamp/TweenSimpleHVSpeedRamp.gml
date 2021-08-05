/// @description  TweenSimpleHVSpeedRamp(hspeed1,vspeed1,hspeed2,vspeed2,dur,ease)
/// @function  TweenSimpleHVSpeedRamp
/// @param hspeed1
/// @param vspeed1
/// @param hspeed2
/// @param vspeed2
/// @param dur
/// @param ease
function TweenSimpleHVSpeedRamp(argument0, argument1, argument2, argument3, argument4, argument5) {

	var _key = id+TWEEN_SIMPLE.HVSPEED_RAMP;
	var _sharedTweener = SharedTweener();
	var _tween;

	if (ds_map_exists(_sharedTweener.simpleTweens, _key) == false)
	{
	    _tween = global.TGMS_MAP_TWEEN[1][? TweenCreate(id, 0, false)];
	    _tween[@ TWEEN.SIMPLE_KEY] = _key;
	    _tween[@ TWEEN.DESTROY] = true;
	    _sharedTweener.simpleTweens[? _key] = _tween;
	}
	else
	{
	    _tween = _sharedTweener.simpleTweens[? _key];
	}

	_tween[@ TWEEN.PROPERTY] = TPSetExt(ext_hvspeed__, argument0, argument2, argument1, argument3);
	_tween[@ TWEEN.DELTA] = _sharedTweener.simpleTweensUseDelta;
	TweenPlayOnce(_tween[TWEEN.ID], argument5, 0, 1, argument4);
	return _tween[TWEEN.ID];



}
