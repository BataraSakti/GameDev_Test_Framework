/// @description  TweenReverseTarget(target)
/// @function  TweenReverseTarget
/// @param target
function TweenReverseTarget(argument0) {

	var _tweens = SharedTweener().tweens;
	var _index = -1;

	repeat(qs_list_size(_tweens))
	{
	    var _tween = _tweens[1][| ++_index];
    
	    if (_tween[TWEEN.TARGET] == argument0)
	    {
	        TweenReverse(_tween[TWEEN.ID]);
	    }
	}



}
