/// @description  TweenFinishTarget(target,call_event)
/// @function  TweenFinishTarget
/// @param target
/// @param call_event
function TweenFinishTarget(argument0, argument1) {

	var _tweens = SharedTweener().tweens;
	var _index = -1;

	repeat(qs_list_size(_tweens))
	{
	    var _tween = _tweens[1][| ++_index];
    
	    if (_tween[TWEEN.TARGET] == argument0)
	    {
	        TweenFinish(_tween[TWEEN.ID], argument1);
	    }
	}



}
