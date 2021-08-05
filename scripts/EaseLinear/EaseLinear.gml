/// @description  EaseLinear(time,start,change,duration)
/// @function  EaseLinear
/// @param time
/// @param start
/// @param change
/// @param duration
function EaseLinear(argument0, argument1, argument2, argument3) {

	if (argument3 != 0){
	    return argument2 * argument0 / argument3 + argument1;
	} else {
	    show_debug("EaseLinear: prevented divide-by-zero");
	    return argument2 * argument0 / (argument3 + 0.001) + argument1 ;
	}




}
