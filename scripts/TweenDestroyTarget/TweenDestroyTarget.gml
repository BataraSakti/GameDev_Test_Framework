/// @description  TweenDestroyTarget(target)
/// @function  TweenDestroyTarget
/// @param target
function TweenDestroyTarget(argument0) {

	var _tweens = SharedTweener().tweens;
	var _index = -1;
	if(qs_exists(_tweens, ds_type_list)){
		repeat(qs_list_size(_tweens))
		{
		    var _t = _tweens[1][| ++_index];
    
		    if (_t[TWEEN.TARGET] == argument0)
		    {
		        TweenDestroy(_t[TWEEN.ID]);
		    }
		}
	}



}
