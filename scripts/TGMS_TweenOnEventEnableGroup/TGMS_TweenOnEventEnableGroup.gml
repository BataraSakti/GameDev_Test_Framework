/// @description  TGMS_TweenOnEventEnableGroup(group,deactivated,enable,EVENT_TYPE)
/// @function  TGMS_TweenOnEventEnableGroup
/// @param group
/// @param deactivated
/// @param enable
/// @param EVENT_TYPE
function TGMS_TweenOnEventEnableGroup(argument0, argument1, argument2, argument3) {

	var _tweens = SharedTweener().tweens;
	var _index = -1;

	if (argument1)
	{
	    repeat(qs_list_size(_tweens))
	    {
	        _tween = _tweens[1][| ++_index];
    
	        if (_tween[TWEEN.GROUP] == argument0 && TweenExists(_tween[TWEEN.ID]))
	        {
	            TGMS_TweenOnEventEnable(_tween[TWEEN.ID], argument2, argument3);
	        }
	    }
	}
	else
	{
	    repeat(qs_list_size(_tweens))
	    {
	        _tween = _tweens[1][| ++_index];
    
	        if (_tween[TWEEN.GROUP] == argument0)
	        {
	            with(_tween[TWEEN.TARGET])
	            {
	                TGMS_TweenOnEventEnable(_tween[TWEEN.ID], argument2, argument3);
	            }
	        }
	    }
	}



}
