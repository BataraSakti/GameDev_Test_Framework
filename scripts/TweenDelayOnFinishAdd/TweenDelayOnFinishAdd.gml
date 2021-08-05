/// @description  TweenDelayOnFinishAdd(delay,target,script,arg0,arg1,...)
/// @function  TweenDelayOnFinishAdd
/// @param delay
/// @param target
/// @param script
/// @param arg0
/// @param arg1
/// @param ...
function TweenDelayOnFinishAdd() {
	// return: callback

	var _params, _index = -1;

	repeat(argument_count)
	{
	    _index++;
	    _params[_index] = argument[_index];
	}

	return TGMS_TweenDelayOnEventAdd(_params, TWEEN_DELAY_EVENT.FINISH);



}
