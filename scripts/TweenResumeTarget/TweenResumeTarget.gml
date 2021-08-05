/// @description  TweenResumeTarget(target)
/// @function  TweenResumeTarget
/// @param target
function TweenResumeTarget(argument0) {

	var _tweens = SharedTweener().tweens;
	var _index = -1;

	repeat(qs_list_size(_tweens))
	{
	    var _t = _tweens[1][| ++_index];
    
	    if (_t[TWEEN.TARGET] == argument0)
	    {
	        TweenResume(_t[TWEEN.ID]);
	    }
	}



}
