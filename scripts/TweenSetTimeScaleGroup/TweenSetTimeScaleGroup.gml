/// @description  TweenSetTimeScaleGroup(group,deactivated,scale)
/// @function  TweenSetTimeScaleGroup
/// @param group
/// @param deactivated
/// @param scale
function TweenSetTimeScaleGroup(argument0, argument1, argument2) {

	var _tweens = SharedTweener().tweens;

	if (argument1)
	{
	    var _index = -1;
	    repeat(qs_list_size(_tweens))
	    {
	        var _t = _tweens[1][| ++_index];
        
	        if (_t[TWEEN.GROUP] == argument0 && TweenExists(_t[TWEEN.ID]))
	        {
	            TweenSetTimeScale(_t[TWEEN.ID], argument2);
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
	                TweenSetTimeScale(_t[TWEEN.ID], argument2);
	            }
	        }
	    }
	} 



}
