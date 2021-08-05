/// @description  EaseOutQuad(time,start,change,duration)
/// @function  EaseOutQuad
/// @param time
/// @param start
/// @param change
/// @param duration
function EaseOutQuad(argument0, argument1, argument2, argument3) {

	argument0 /= argument3;
	return -argument2 * argument0 * (argument0 - 2) + argument1;




}
