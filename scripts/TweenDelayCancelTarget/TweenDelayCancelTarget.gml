/// @description  TweenDelayCancelTarget(target)
/// @function  TweenDelayCancelTarget
/// @param target
function TweenDelayCancelTarget(argument0) {

	var _delayedTweens = SharedTweener().delayedTweens;
	var _index = -1;

	repeat(qs_list_size(_delayedTweens))
	{
	    var _tween = _delayedTweens[1][| ++_index]; // Cache delay data
    
	    if (_tween[TWEEN.TARGET] == argument0)
	    {
	        TweenDelayCancel(_tween[TWEEN.ID]);
	    }
	}



}
