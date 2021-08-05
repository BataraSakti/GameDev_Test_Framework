/// @description  TweenDelayPauseGroup(group,deactivated)
/// @function  TweenDelayPauseGroup
/// @param group
/// @param deactivated
function TweenDelayPauseGroup(argument0, argument1) {

	var _delayedTweens = SharedTweener().delayedTweens;
	var _index = -1;

	if (argument1)
	{
	    repeat(qs_list_size(_delayedTweens))
	    {
	        var _t = _delayedTweens[1][| ++_index];
        
	        if (_t[TWEEN.GROUP] == argument0 && TweenExists(_t[TWEEN.ID]))
	        {
	            TweenDelayPause(_t[TWEEN.ID]);
	        }
	    }
	}
	else
	{
	    repeat(qs_list_size(_delayedTweens))
	    {
	        var _t = _delayedTweens[1][| ++_index];
        
	        if (_t[TWEEN.GROUP] == argument0)
	        {
	            with(_t[TWEEN.TARGET])
	            {
	                TweenDelayPause(_t[TWEEN.ID]);
	            }
	        }
	    }
	}



}
