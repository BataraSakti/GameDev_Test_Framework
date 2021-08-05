/// @description  EaseInQuad(time,start,change,duration)
/// @function  EaseInQuad
/// @param time
/// @param start
/// @param change
/// @param duration
function EaseInQuad(argument0, argument1, argument2, argument3) {

	argument0 /= argument3;
	return argument2 * argument0 * argument0 + argument1;




}
