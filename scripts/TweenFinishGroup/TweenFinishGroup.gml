/// @description  TweenFinishGroup(group,deactivated,call_event)
/// @function  TweenFinishGroup
/// @param group
/// @param deactivated
/// @param call_event
function TweenFinishGroup(argument0, argument1, argument2) {

	var _tweens = SharedTweener().tweens;    
	var _index = -1;

	if (argument1)
	{
	    var _index = -1;
	    repeat(qs_list_size(_tweens))
	    {
	        var _t = _tweens[1][| ++_index];
        
	        if (_t[TWEEN.GROUP] == argument0 && TweenExists(_t[TWEEN.ID]))
	        {
	            TweenFinish(_t[TWEEN.ID], argument2);
	        }
	    }
	}
	else
	{
	    var _index = -1;
	    repeat(qs_list_size(_tweens))
	    {
	        var _t = _tweens[1][| ++_index];
        
	        if (_t[TWEEN.GROUP] == argument0)
	        {
	            with(_t[TWEEN.TARGET])
	            {
	                TweenFinish(_t[TWEEN.ID], argument2);
	            }
	        }
	    }
	}



}
