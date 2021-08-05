/// @description  TweenDelayFinishGroup(group,deactivated)
/// @function  TweenDelayFinishGroup
/// @param group
/// @param deactivated
function TweenDelayFinishGroup(argument0, argument1) {

	var _delayedTweens = SharedTweener().delayedTweens;
	var _index = -1;

	if (argument1) {
	    repeat(qs_list_size(_delayedTweens)) {
	        var _t = _delayedTweens[1][| ++_index];
        
	        if (_t[TWEEN.GROUP] == argument0 && TweenExists(_t[TWEEN.ID])) {
	            TweenDelayFinish(_t[TWEEN.ID]);
	        }
	    }
	} else {
	    repeat(qs_list_size(_delayedTweens))
	    {
	        var _t = _delayedTweens[1][| ++_index];
        
	        if (_t[TWEEN.GROUP] == argument0) {
	            with(_t[TWEEN.TARGET]) {
	                TweenDelayFinish(_t[TWEEN.ID]);
	            }
	        }
	    }
	}
}
