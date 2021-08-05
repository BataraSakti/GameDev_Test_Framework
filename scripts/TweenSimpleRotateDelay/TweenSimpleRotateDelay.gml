/// @description  TweenSimpleRotateDelay(angle1,angle2,dur,ease,delay)
/// @function  TweenSimpleRotateDelay
/// @param angle1
/// @param angle2
/// @param dur
/// @param ease
/// @param delay
function TweenSimpleRotateDelay(argument0, argument1, argument2, argument3, argument4) {

	var _key = id+TWEEN_SIMPLE.ROTATE;
	var _sharedTweener = SharedTweener();
	var _tween;

	if (ds_map_exists(_sharedTweener.simpleTweens, _key) == false)
	{
	    _tween = global.TGMS_MAP_TWEEN[1][? TweenCreate(id, image_angle__, false)];
	    _tween[@ TWEEN.SIMPLE_KEY] = _key;
	    _tween[@ TWEEN.DESTROY] = true;
	    _sharedTweener.simpleTweens[? _key] = _tween;
	}
	else
	{
	    _tween = _sharedTweener.simpleTweens[? _key];
	}

	_tween[@ TWEEN.DELTA] = _sharedTweener.simpleTweensUseDelta;

	var _return;
	_return[0] = _tween[TWEEN.ID];
	_return[1] = TweenPlayOnceDelay(_tween[TWEEN.ID], argument4, argument3, argument0, argument1, argument2);

	return _return;



}
