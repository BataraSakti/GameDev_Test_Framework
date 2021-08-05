/// @description  TweenFinishAll(deactivated,call_event)
/// @function  TweenFinishAll
/// @param deactivated
/// @param call_event
function TweenFinishAll(argument0, argument1) {

	var _tweens = SharedTweener().tweens;
	var _index = -1;

	if (argument0)
	{
	    repeat(qs_list_size(_tweens))
	    {
	        var _tween = _tweens[1][| ++_index];
        
	        if (TweenExists(_tween[TWEEN.ID]))
	        {
	            TweenFinish(_tween[TWEEN.ID], argument1);
	        }
	    }
	}
	else
	{
	    repeat(qs_list_size(_tweens))
	    {
	        var _tween = _tweens[1][| ++_index];
        
	        with(_tween[TWEEN.TARGET])
	        {
	            TweenFinish(_tween[TWEEN.ID], argument1);
	        }
	    }
	}



}
