/// @description scp_create_button_with_action(x,y,btn,action_id);
/// @function scp_create_button_with_action
/// @param x
/// @param y
/// @param layer
/// @param btn
/// @param action_id
function scp_create_button_with_action(argument0, argument1, argument2, argument3, argument4) {

	var ccbtn = instance_create_layer(argument0, argument1, argument2, argument3);
	with(ccbtn) { action_id = argument4; }




}
