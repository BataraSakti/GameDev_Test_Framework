/// @description  TweenSimpleColour(col1,col2,dur,ease)
/// @function  TweenSimpleColour
/// @param col1
/// @param col2
/// @param dur
/// @param ease
function TweenSimpleColour(argument0, argument1, argument2, argument3) {

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

	_tween[@ TWEEN.PROPERTY] = TPSetExt(ext_image_blend__, argument0, argument1);
	_tween[@ TWEEN.DELTA] = _sharedTweener.simpleTweensUseDelta;
	TweenPlayOnce(_tween[TWEEN.ID], argument3, 0, 1, argument2);

	return _tween[TWEEN.ID];



}
