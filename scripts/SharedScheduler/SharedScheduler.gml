/// @description  SharedScheduler()
/// @function  SharedScheduler
function SharedScheduler() {

	if (instance_exists(global.SGMS_SharedScheduler))
	{
	    return global.SGMS_SharedScheduler;
	}
	else
	{
	    instance_activate_object(global.SGMS_SharedScheduler);
    
	    if (instance_exists(global.SGMS_SharedScheduler))
	    {
	        return global.SGMS_SharedScheduler;
	    }
	    else
	    {
	        global.SGMS_SharedScheduler = instance_create_layer(-1000000, -1000000, global.layer_controllers, obj_SharedScheduler);
	        return global.SGMS_SharedScheduler;
	    }
	}



}
