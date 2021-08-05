/// @description  TweenIteratorNext(iterator)
/// @function  TweenIteratorNext
/// @param iterator
function TweenIteratorNext(argument0) {

	while(true)
	{
	    if (++argument0[@ 1] < argument0[2])
	    {
	        var _tween = ds_list_find_value(argument0[3], argument0[1]);
        
	        if (instance_exists(_tween[TWEEN.TARGET]))
	        {
	            argument0[@ 0] = _tween[TWEEN.ID];
	            return true;
	        }
        
	        instance_activate_object(_tween[TWEEN.TARGET]);
        
	        if (instance_exists(_tween[TWEEN.TARGET]))
	        {
	            instance_deactivate_object(_tween[TWEEN.TARGET]);
	            argument0[@ 0] = _tween[TWEEN.ID];
	            return true;
	        }
	    }
	    else
	    {
	        return false;
	    }
	}



}
