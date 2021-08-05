/// @description  EaseInOutCubic(time,start,change,duration)
/// @function  EaseInOutCubic
/// @param time
/// @param start
/// @param change
/// @param duration
function EaseInOutCubic(argument0, argument1, argument2, argument3) {

	argument0 /= argument3 * 0.5;

	if (argument0 < 1)
	{
	   return argument2 * 0.5 * power(argument0, 3) + argument1;
	}

	return argument2 * 0.5 * (power(argument0 - 2, 3) + 2) + argument1;




}
