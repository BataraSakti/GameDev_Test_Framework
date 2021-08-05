/// @description  TweenCallbackExists(callback)
/// @function  TweenCallbackExists
/// @param callback
function TweenCallbackExists(argument0) {

	if (argument0 && ds_map_exists(global.TGMS_MAP_CALLBACK, argument0))
	{
	    var _cb = global.TGMS_MAP_CALLBACK[1][? argument0];
	    var _target = _cb[TWEEN_CALLBACK.TARGET];
    
	    if (instance_exists(_target))
	    {
	        return true;
	    }
    
	    instance_activate_object(_target);
    
	    if (instance_exists(_target))
	    {
	        instance_deactivate_object(_target);
	        return true;
	    }
	}



}
