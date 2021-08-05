/// @description  TweenSystemCountStopped()
/// @function  TweenSystemCountStopped
function TweenSystemCountStopped() {
	/*
	    Returns total number of existing tweens which are stopped
	*/

	var _tweens = SharedTweener().tweens; 
	var _total = 0;
	var _index = -1;   

	repeat(qs_list_size(_tweens))
	{
	    var _tween = _tweens[1][| ++_index];
	    _total += _tween[TWEEN.STATE] == TWEEN_STATE.STOPPED;
	}

	return _total;



}
