/// @description  EaseInQuart(time,start,change,duration)
/// @function  EaseInQuart
/// @param time
/// @param start
/// @param change
/// @param duration
function EaseInQuart(argument0, argument1, argument2, argument3) {

	return argument2 * power(argument0 / argument3, 4) + argument1;




}
