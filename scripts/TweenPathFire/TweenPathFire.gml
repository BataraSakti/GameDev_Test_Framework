/// @description  TweenPathFire(target,path,absolute,delta,dur,ease)
/// @function  TweenPathFire
/// @param target
/// @param path
/// @param absolute
/// @param delta
/// @param dur
/// @param ease
function TweenPathFire() {
	// TweenPathFire(target,path,absolute,delta,dur,ease,**->mode)

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
    
	    // IF absolute
	    if (argument[2])
	    {
	        _tween[@ TWEEN.PROPERTY] = TPSetExt(ext_path__, argument[1], argument[2], 0, 0, 0, 0, _repeat);
	    }
	    else
	    {
	        var _path_xstart = path_get_x(argument[1], 0);
	        var _path_ystart = path_get_y(argument[1], 0);
	        _tween[@ TWEEN.PROPERTY] = TPSetExt(ext_path__, argument[1], argument[2], _path_xstart, _path_ystart, x-_path_xstart, y-_path_ystart, _repeat);
	    }
    
	    // Execute propery playmode
	    if (argument_count == 6)
	    {
	        TweenPlayOnce(_tween[TWEEN.ID], argument[5], 0, 1, argument[4]);
	    }
	    else
	    {
	        TweenPlayOnce(_tween[TWEEN.ID], argument[5], 0, 1, argument[4], argument[6]);
	    }
    
	    return _tween[TWEEN.ID];
	}



}
