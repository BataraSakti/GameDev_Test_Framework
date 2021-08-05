/// @description  TGMS_TweenOnEventEnableAll(deactivated,enable,EVENT_TYPE)
/// @function  TGMS_TweenOnEventEnableAll
/// @param deactivated
/// @param enable
/// @param EVENT_TYPE
function TGMS_TweenOnEventEnableAll(argument0, argument1, argument2) {

	var _tweens = SharedTweener().tweens;  
	var _index = -1;

	if (argument0)
	{
	    repeat(qs_list_size(_tweens))
	    {
	        var _tween = _tweens[1][| ++_index];
        
	        if (TweenExists(_tween[TWEEN.ID]))
	        {
	            TGMS_TweenOnEventEnable(_tween[TWEEN.ID], argument1, argument2);
	        }
	    }
	}
	else
	{
	    var _tween = _tweens[1][| ++_index];
        
	    with(_tween[TWEEN.TARGET])
	    {
	        TGMS_TweenOnEventEnable(_tween[TWEEN.ID], argument1, argument2);
	    }
	}



}
