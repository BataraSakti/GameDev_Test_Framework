/// @description  TweenSimpleMoveDelay(x1,y1,x2,y2,dur,ease,delay)
/// @function  TweenSimpleMoveDelay
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param dur
/// @param ease
/// @param delay
function TweenSimpleMoveDelay(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	var _key = id+TWEEN_SIMPLE.MOVE;
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
	_return[1] = TweenPlayOnceDelay(_tween[TWEEN.ID], argument6, argument5, 0, 1, argument4);
	TweenDelayPropertySetter(_return[1], TPSetExt(ext_xy__, argument0, argument2, argument1, argument3));

	return _return;



}
