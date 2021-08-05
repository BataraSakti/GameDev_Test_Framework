///@description scp_variable_instance_set(id, name, val)
///@param id
///@param name
///@param val
function scp_variable_instance_set(argument0, argument1, argument2) {

	variable_instance_set(instance_find(argument0,0), argument1, argument2);


}
