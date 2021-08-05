/// @description  TweenDelayFinishTarget(target)
/// @function  TweenDelayFinishTarget
/// @param target
function TweenDelayFinishTarget(argument0) {

	var _delayedTweens = SharedTweener().delayedTweens;
	var _index = -1;

	repeat(qs_list_size(_delayedTweens)) {
	    var _tween = _delayedTweens[1][| ++_index];
    
	    if (_tween[TWEEN.TARGET] == argument0) {
	        TweenDelayFinish(_tween[TWEEN.ID]);
	    }
	}
}
