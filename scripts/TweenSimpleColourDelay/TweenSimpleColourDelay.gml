/// @description  TweenSimpleColourDelay(col1,col2,dur,ease,delay)
/// @function  TweenSimpleColourDelay
/// @param col1
/// @param col2
/// @param dur
/// @param ease
/// @param delay
function TweenSimpleColourDelay(argument0, argument1, argument2, argument3, argument4) {

	var _key = id+TWEEN_SIMPLE.COLOUR;
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

	_tween[@ TWEEN.DELTA] = _sharedTweener.simpleTweensUseDelta;

	var _return;
	_return[0] = _tween[TWEEN.ID];
	_return[1] = TweenPlayOnceDelay(_tween[TWEEN.ID], argument4, argument3, 0, 1, argument2);
	TweenDelayPropertySetter(_return[1], TPSetExt(ext_image_blend__, argument0, argument1));

	return _return;



}
