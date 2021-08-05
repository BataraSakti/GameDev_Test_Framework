/// @description  TweenResumeGroup(group,deactivated)
/// @function  TweenResumeGroup
/// @param group
/// @param deactivated
function TweenResumeGroup(argument0, argument1) {
    
	var _tweens = SharedTweener().tweens;  
	var _index = -1;

	if (argument1)
	{
	    repeat(qs_list_size(_tweens))
	    {
	        var _t = _tweens[1][| ++_index];
        
	        if (_t[TWEEN.GROUP] == argument0 && TweenExists(_t[TWEEN.ID]))
	        {
	            TweenResume(_t[TWEEN.ID]);
	        }
	    }
	}
	else
	{
	    repeat(qs_list_size(_tweens))
	    {
	        var _t = _tweens[1][| ++_index];
        
	        if (_t[TWEEN.GROUP] == argument0)
	        {
	            with(_t[TWEEN.TARGET])
	            { 
	                TweenResume(_t[TWEEN.ID]);
	            }
	        }
	    }
	}



}
