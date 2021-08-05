/// @description  TweenDelayResumeTarget(target)
/// @function  TweenDelayResumeTarget
/// @param target
function TweenDelayResumeTarget(argument0) {

	var _delayedTweens = SharedTweener().delayedTweens;
	var _index = -1;

	repeat(qs_list_size(_delayedTweens))
	{
	    var _tween = _delayedTweens[1][| ++_index];
    
	    if (_tween[TWEEN.TARGET] == argument0)
	    {
	        TweenDelayResume(_tween[TWEEN.ID]);
	    }
	}



}
