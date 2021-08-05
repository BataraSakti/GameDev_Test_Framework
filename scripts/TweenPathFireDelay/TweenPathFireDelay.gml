/// @description  TweenPathFireDelay(target,path,absolute,delta,dur,ease,delay)
/// @function  TweenPathFireDelay
/// @param target
/// @param path
/// @param absolute
/// @param delta
/// @param dur
/// @param ease
/// @param delay
function TweenPathFireDelay() {
	// TweenPathFireDelay(target,path,absolute,delta,dur,ease,delay,**->mode)

	with(argument[0])
	{  
	    var _key = id+TWEEN_SIMPLE.PATH;
	    var _sharedTweener = SharedTweener();
	    var _tween;
    
	    if (ds_map_exists(_sharedTweener.simpleTweens, _key) == false)
	    {
	        _tween = global.TGMS_MAP_TWEEN[1][? TweenCreate(id, 0, false)];
	        _tween[@ TWEEN.SIMPLE_KEY] = _key;
	        _tween[@ TWEEN.DESTROY] = true;
	        _sharedTweener.simpleTweens[? _key] = _tween;
	    }
	    else
	    {
	        _tween = _sharedTweener.simpleTweens[? _key];
	    }
    
	    // Set delta
	    _tween[@ TWEEN.DELTA] = argument[3];
    
	    var _repeat = false;
	    if (argument_count == 7)
	    {
	        _repeat = argument[6] == TWEEN_PLAY.REPEAT;
	    }
    
	    var _delayID;
    
	    // Execute propery playmode
	    if (argument_count == 6)
	    {
	        _delayID = TweenPlayOnceDelay(_tween[TWEEN.ID], argument[6], argument[5], 0, 1, argument[4]);
	    }
	    else
	    {
	        _delayID = TweenPlayOnceDelay(_tween[TWEEN.ID], argument[6], argument[5], 0, 1, argument[4], argument[7]);
	    }
    
	    // IF path is absolute
	    if (argument[2])
	    {
	        TweenDelayPropertySetter(_delayID, TPSetExt(ext_path__, argument[1], argument[2], 0, 0, 0, 0, _repeat));
	    }
	    else
	    {
	        var _path_xstart = path_get_x(argument[1], 0);
	        var _path_ystart = path_get_y(argument[1], 0);
	        TweenDelayPropertySetter(_delayID, TPSetExt(ext_path__, argument[1], argument[2], _path_xstart, _path_ystart, x-_path_xstart, y-_path_ystart, _repeat));
	    }
    
	    var _return;
	    _return[0] = _tween[TWEEN.ID];
	    _return[1] = _delayID;
    
	    return _return;
	}



}
