/// @description  TweenDelayFinish(tween,[delay])
/// @function  TweenDelayFinish
/// @param tween
/// @param [delay]
function TweenDelayFinish() {

	if (argument[0]) {
	    if (argument_count == 1) {
	        var _t = global.TGMS_MAP_TWEEN[1][? argument[0]];
	        var _delays = _t[TWEEN.DELAYS];
        
	        if (is_ds_type_list(_delays)) {
	            var _index = -1;
	            repeat(qs_list_size(_delays)) {
	                var _d = _delays[1][| ++_index]; 
                
	                if (_d[TWEEN_DELAY.STATE] != TWEEN_DELAY_STATE.CANCELED) {
	                    // Mark for removal
	                    _d[@ TWEEN_DELAY.STATE] = TWEEN_DELAY_STATE.CANCELED;
	                    // Invalidate handle
	                    qs_map_delete(global.TGMS_MAP_DELAY, _d[TWEEN_DELAY.ID]);
	                    // Clear self reference with null callback
	                    _d[@ TWEEN_DELAY.ID] = 0;
	                    // Play tween using values stored in delay data
	                    TweenPlayOnce(_t[TWEEN.ID], _d[TWEEN_DELAY.EASE], _d[TWEEN_DELAY.START], _d[TWEEN_DELAY.DESTINATION], _d[TWEEN_DELAY.DURATION], _d[TWEEN_DELAY.PLAY_MODE]);
	                    // Execute onFinish delay event
	                    TGMS_ExecuteEvent(_d[TWEEN_DELAY.EVENTS], TWEEN_DELAY_EVENT.FINISH);
	                }
	            }
	        }
	    } else {
	        if (argument[1]) {
	            var _t = global.TGMS_MAP_TWEEN[1][? argument[0]];
	            var _d = global.TGMS_MAP_DELAY[1][? argument[1]];
            
	            if (_d[TWEEN_DELAY.STATE] != TWEEN_DELAY_STATE.CANCELED) {
	                // Mark for removal
	                _d[@ TWEEN_DELAY.STATE] = TWEEN_DELAY_STATE.CANCELED;
	                // Invalidate handle
	                qs_map_delete(global.TGMS_MAP_DELAY, _d[TWEEN_DELAY.ID]);
	                // Clear self reference with null callback
	                _d[@ TWEEN_DELAY.ID] = 0;
	                // Play tween using values stored in delay data
	                TweenPlayOnce(_t[TWEEN.ID], _d[TWEEN_DELAY.EASE], _d[TWEEN_DELAY.START], _d[TWEEN_DELAY.DESTINATION], _d[TWEEN_DELAY.DURATION], _d[TWEEN_DELAY.PLAY_MODE]);
	                // Execute onFinish delay event
	                TGMS_ExecuteEvent(_d[TWEEN_DELAY.EVENTS], TWEEN_DELAY_EVENT.FINISH);
	            }
	        }
	    }
	}
}
