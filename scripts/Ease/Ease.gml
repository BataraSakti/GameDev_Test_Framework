/// @description  Ease(value1,value2,amount,ease)
/// @function  Ease
/// @param value1
/// @param value2
/// @param amount
/// @param ease
function Ease(argument0, argument1, argument2, argument3) {

	return script_execute(argument3, argument2, argument0, argument1-argument0, 1);



}
