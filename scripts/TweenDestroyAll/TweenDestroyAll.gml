/// @description  TweenDestroyAll(deactivated)
/// @function  TweenDestroyAll
/// @param deactivated
function TweenDestroyAll(argument0) {
    
	var _tweens = SharedTweener().tweens;
	var _index = -1;

	if (argument0)
	{
	    repeat(qs_list_size(_tweens))
	    {
	        var _t = _tweens[1][| ++_index];
        
	        if (TweenExists(_t[TWEEN.ID]))
	        {
	            TweenDestroy(_t[TWEEN.ID]);
	        }
	    }
	}
	else
	{
	    repeat(qs_list_size(_tweens))
	    {
	        var _t = _tweens[1][| ++_index];
        
	        with(_t[TWEEN.TARGET])
	        {
	            TweenDestroy(_t[TWEEN.ID]);
	        }
	    }
	}



}
