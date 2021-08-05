/// @description  TweenStopTarget(target);
/// @function  TweenStopTarget
/// @param target
function TweenStopTarget(argument0) {

	var _tweens = SharedTweener().tweens;
	var _index = -1;

	repeat(qs_list_size(_tweens))
	{
	    var _t = _tweens[1][| ++_index];
    
	    if (_t[TWEEN.TARGET] == argument0)
	    {
	        TweenStop(_t[TWEEN.ID]);
	    }
	}



}
