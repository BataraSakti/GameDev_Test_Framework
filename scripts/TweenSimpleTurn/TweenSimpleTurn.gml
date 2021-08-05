/// @description  TweenSimpleTurn(dir1,dir2,dur,ease)
/// @function  TweenSimpleTurn
/// @param dir1
/// @param dir2
/// @param dur
/// @param ease
function TweenSimpleTurn(argument0, argument1, argument2, argument3) {

	var _key = id+TWEEN_SIMPLE.TURN;
	var _sharedTweener = SharedTweener();
	var _tween;

	if (ds_map_exists(_sharedTweener.simpleTweens, _key) == false)
	{
	    _tween = global.TGMS_MAP_TWEEN[1][? TweenCreate(id, direction__, false)];
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
