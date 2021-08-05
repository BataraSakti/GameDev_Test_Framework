/// @description  TweenSetTimeScaleTarget(target,scale)
/// @function  TweenSetTimeScaleTarget
/// @param target
/// @param scale
function TweenSetTimeScaleTarget(argument0, argument1) {

	var _tweens = SharedTweener().tweens;
	var _index = -1;

	repeat(qs_list_size(_tweens))
	{
	    var _tween = _tweens[1][| ++_index];
    
	    if (_tween[TWEEN.TARGET] == argument0)
	    {
	        TweenSetTimeScale(_tween[TWEEN.ID], argument1);
	    }
	}



}
