/// @description  TweenFirePatrolDelay(target,property,delta,ease,start,dest,dur,delay);
/// @function  TweenFirePatrolDelay
/// @param target
/// @param property
/// @param delta
/// @param ease
/// @param start
/// @param dest
/// @param dur
/// @param delay
function TweenFirePatrolDelay(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	var _tweenHandle = TweenCreate(argument0, argument1, argument2, argument3, argument4, argument5, argument6);
	TweenDestroyWhenDone(_tweenHandle, true, false);
	var _delayHandle = TweenPlayPatrolDelay(_tweenHandle, argument7);

	var _return;
	_return[0] = _tweenHandle;
	_return[1] = _delayHandle;

	return _return;



}
