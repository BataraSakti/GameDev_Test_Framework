/// @description  TweenPlayOnceGroup(group,deactivated)
/// @function  TweenPlayOnceGroup
/// @param group
/// @param deactivated
function TweenPlayOnceGroup(argument0, argument1) {

	var _tweens = SharedTweener().tweens;    
	var _index = -1;

	if (argument1)
	{
	    repeat(qs_list_size(_tweens))
	    {
	        var _t = _tweens[1][| ++_index];
        
	        if (_t[TWEEN.GROUP] == argument0 && TweenExists(_t[TWEEN.ID]))
	        { 
	            TweenPlayOnce(_t[TWEEN.ID], _t[TWEEN.PLAY_MODE]);
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
	                TweenPlayOnce(_t[TWEEN.ID], _t[TWEEN.PLAY_MODE]);
	            }
	        }
	    }
	}



}
