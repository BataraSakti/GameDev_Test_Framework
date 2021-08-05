/// @description  EaseOutCirc(time,start,change,duration)
/// @function  EaseOutCirc
/// @param time
/// @param start
/// @param change
/// @param duration
function EaseOutCirc(argument0, argument1, argument2, argument3) {

	argument0 = argument0 / argument3 - 1;
	return argument2 * sqrt(1 - argument0 * argument0) + argument1;




}
