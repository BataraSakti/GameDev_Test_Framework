/// @description  TweenSetTimeScaleAll(deactivated,scale)
/// @function  TweenSetTimeScaleAll
/// @param deactivated
/// @param scale
function TweenSetTimeScaleAll(argument0, argument1) {

	var _tweens = SharedTweener().tweens;

	if (argument0)
	{
	    var _index = -1;
	    repeat(qs_list_size(_tweens))
	    {
	        var _t = _tweens[1][| ++_index];
        
	        if (TweenExists(_t[TWEEN.ID]))
	        {
	            TweenSetTimeScale(_t[TWEEN.ID], argument1);
	        }
	    }
	}
	else
	{
	    var _index = -1;
	    repeat(qs_list_size(_tweens))
	    {
	        var _t = _tweens[1][| ++_index];
        
	        with(_t[TWEEN.TARGET])
	        {
	            TweenSetTimeScale(_t[TWEEN.ID], argument1);
	        }
	    }
	} 



}
