/// @description  TweenDelayFinishAll(deactivated)
/// @function  TweenDelayFinishAll
/// @param deactivated
function TweenDelayFinishAll(argument0) {

	var _delayedTweens = SharedTweener().delayedTweens;
	var _index = -1;

	if (argument0) {
	    repeat(qs_list_size(_delayedTweens)) {
	        var _t = _delayedTweens[1][| ++_index];
        
	        if (TweenExists(_t[TWEEN.ID])) {
	            TweenDelayFinish(_t[TWEEN.ID]);
	        }
	    }
	} else {
	    repeat(qs_list_size(_delayedTweens)) {
	        var _t = _delayedTweens[1][| ++_index];
        
	        with(_t[TWEEN.TARGET]) {
	            TweenDelayFinish(_t[TWEEN.ID]);
	        }
	    }
	}
}
