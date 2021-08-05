/// @description  TweenDestroyGroup(group,deactivated)
/// @function  TweenDestroyGroup
/// @param group
/// @param deactivated
function TweenDestroyGroup(argument0, argument1) {
   
	var _tweens = SharedTweener().tweens;

	if (argument1)
	{
	    var _index = -1;
	    repeat(qs_list_size(_tweens))
	    {
	        var _t = _tweens[1][| ++_index];
    
	        if (_t[TWEEN.GROUP] == argument0 && TweenExists(_t[TWEEN.ID]))
	        {   
	            TweenDestroy(_t[TWEEN.ID]);
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
	                TweenDestroy(_t[TWEEN.ID]);
	            }
	        }
	    }
	}
}
