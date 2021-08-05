/// @description  TweenExists(tween)
/// @function  TweenExists
/// @param tween
function TweenExists(argument0) {
	
	var _t;

	if (is_real(argument0)){
	    if (qs_map_exists(global.TGMS_MAP_TWEEN, argument0)){
	        _t = global.TGMS_MAP_TWEEN[1][? argument0];
	    }else{
	        return false;
	    }
	}else if (is_array(argument0)){
	    _t = argument0;
	    if (_t[TWEEN.STATE] == TWEEN_STATE.DESTROYED){
	        return false;
	    }
	}else{
	    return false;
	}
    
	var _target = _t[TWEEN.TARGET];

	if (instance_exists(_target)){
	    return true;
	}

	instance_activate_object(_target);

	if (instance_exists(_target)){
	    instance_deactivate_object(_target);
	    return true;
	}



}
