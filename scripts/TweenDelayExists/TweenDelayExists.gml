/// @description  TweenDelayExists(delay)
/// @function  TweenDelayExists
/// @param delay
function TweenDelayExists(argument0) {

	if (argument0 && ds_map_exists(global.TGMS_MAP_DELAY, argument0))
	{
	    var _d = global.TGMS_MAP_DELAY[1][? argument0];
	    var _t = _d[TWEEN_DELAY.TWEEN];
	    var _target = _t[TWEEN.TARGET];
    
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
