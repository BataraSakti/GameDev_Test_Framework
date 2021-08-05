/// @description  EaseInBack(time,start,change,duration)
/// @function  EaseInBack
/// @param time
/// @param start
/// @param change
/// @param duration
function EaseInBack(argument0, argument1, argument2, argument3) {

	var _s = 1.70158;

	argument0 /= argument3;
	return argument2 * argument0 * argument0 * ((_s + 1) * argument0 - _s) + argument1;




}
