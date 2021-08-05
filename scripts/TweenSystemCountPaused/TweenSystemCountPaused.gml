/// @description  TweenSystemCountPaused()
/// @function  TweenSystemCountPaused
function TweenSystemCountPaused() {
	/*
	    Returns total number of existing tweens which are paused
	*/

	var _tweens = SharedTweener().tweens;
	var _total = 0;
	var _index = -1;

	repeat(qs_list_size(_tweens))
	{
	    var _tween = _tweens[1][| ++_index];
	    _total += _tween[TWEEN.STATE] == TWEEN_STATE.PAUSED;
	}

	return _total;



}
