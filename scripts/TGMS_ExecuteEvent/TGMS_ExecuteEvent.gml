/// @description  TGMS_ExecuteEvent(event_list,event_type)
/// @function  TGMS_ExecuteEvent
/// @param event_list
/// @param event_type
function TGMS_ExecuteEvent(argument0, argument1) {

	// IF events and event type initialized...
	if (argument0 != -1)
	{
	    if (qs_map_exists(argument0, argument1))
	    {
	        // Get event data
	        var _event = qs_map_find_value(argument0, argument1);
        
	        // Iterate through all event callbacks (isEnabled * event list size)
	        var _index = 0;
			show_debug("-- Execute -- "+string(_event[1][| 0])+ " -- -- "+string(qs_list_size(_event)-1));
			if(qs_exists(_event, ds_type_list)) {
				if(qs_list_size(_event) > 0) {
					repeat(_event[1][| 0] * (qs_list_size(_event)-1))
			        {
			            // Cache callback
			            var _cb = _event[1][| ++_index];
			            // Cache target
			            var _target = _cb[TWEEN_CALLBACK.TARGET];
        
			            // Using target environment...
			            with(_target)
			            {
			                // Execute callback script with proper number of arguments
			                switch(array_length(_cb))
			                {
			                case 3: script_execute(_cb[1]); break;
			                case 4: script_execute(_cb[1], _cb[3]); break;
			                case 5: script_execute(_cb[1], _cb[3], _cb[4]); break;
			                case 6: script_execute(_cb[1], _cb[3], _cb[4], _cb[5]); break;
			                case 7: script_execute(_cb[1], _cb[3], _cb[4], _cb[5], _cb[6]); break;
			                case 8: script_execute(_cb[1], _cb[3], _cb[4], _cb[5], _cb[6], _cb[7]); break;
			                case 9: script_execute(_cb[1], _cb[3], _cb[4], _cb[5], _cb[6], _cb[7], _cb[8]); break;
			                case 10: script_execute(_cb[1], _cb[3], _cb[4], _cb[5], _cb[6], _cb[7], _cb[8], _cb[9]); break;
			                case 11: script_execute(_cb[1], _cb[3], _cb[4], _cb[5], _cb[6], _cb[7], _cb[8], _cb[9], _cb[10]); break;
			                case 12: script_execute(_cb[1], _cb[3], _cb[4], _cb[5], _cb[6], _cb[7], _cb[8], _cb[9], _cb[10], _cb[11]); break;
			                case 13: script_execute(_cb[1], _cb[3], _cb[4], _cb[5], _cb[6], _cb[7], _cb[8], _cb[9], _cb[10], _cb[11], _cb[12]); break;
			                case 14: script_execute(_cb[1], _cb[3], _cb[4], _cb[5], _cb[6], _cb[7], _cb[8], _cb[9], _cb[10], _cb[11], _cb[12], _cb[13]); break;
			                case 15: script_execute(_cb[1], _cb[3], _cb[4], _cb[5], _cb[6], _cb[7], _cb[8], _cb[9], _cb[10], _cb[11], _cb[12], _cb[13], _cb[14]); break;
			                case 16: script_execute(_cb[1], _cb[3], _cb[4], _cb[5], _cb[6], _cb[7], _cb[8], _cb[9], _cb[10], _cb[11], _cb[12], _cb[13], _cb[14], _cb[15]); break;   
			                }
			            }
            
			            // IF target does not exist
			            if (instance_exists(_target) == false)
			            {
			                // Attempt to activate target
			                instance_activate_object(_target);
                
			                // IF target now exists
			                if (instance_exists(_target))
			                {
			                    // Put target back to deactivated state
			                    instance_deactivate_object(_target);
			                }
			                else
			                {
			                    // Delete callback from event list -- decrement loop index
			                    qs_list_delete(_event, _index--);
			                    // Invalidate callback handle
			                    qs_map_delete(global.TGMS_MAP_CALLBACK, _cb[TWEEN_CALLBACK.ID]);
			                }
			            }
			        }
				}
			}
        
	    }
	}
}
