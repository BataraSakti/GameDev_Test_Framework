/// @description  TweenSystemCountPlaying()
/// @function  TweenSystemCountPlaying
function TweenSystemCountPlaying() {
	/*
	    Returns total number of tweens being actively played by system
	*/

	var _tweens = SharedTweener().tweens;
	var _total = 0;
	var _index = -1;

	repeat(qs_list_size(_tweens))
	{
	    var _tween = _tweens[1][| ++_index];
	    _total += _tween[TWEEN.STATE] >= 0;
	}

	return _total;



}
