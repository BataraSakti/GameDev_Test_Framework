/// @description  TGMS_TweenOnEventEnableTarget(target,enable,EVENT_TYPE)
/// @function  TGMS_TweenOnEventEnableTarget
/// @param target
/// @param enable
/// @param EVENT_TYPE
function TGMS_TweenOnEventEnableTarget(argument0, argument1, argument2) {

	var _tweens = SharedTweener().tweens;
	var _index = -1;

	repeat(qs_list_size(_tweens))
	{
	    _tween = _tweens[1][| ++_index];

	    if (_tween[TWEEN.TARGET] == argument0)
	    {
	        TGMS_TweenOnEventEnable(_tween[TWEEN.ID], argument1, argument2);
	    }
	}



}
