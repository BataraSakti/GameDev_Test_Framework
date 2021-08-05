/// @description  SharedScheduler_BeginStep()
/// @function  SharedScheduler_BeginStep
function SharedScheduler_BeginStep() {

	//--------------------------
	//  Manage Delta Timing
	//--------------------------
	// Store previous usable delta time format
	var _prevDeltaTime = deltaTime;
	// Update usable delta time format
	deltaTime = delta_time/1000000;

	// Let's prevent delta time from exhibiting sporadic behaviour, shall we?
	if (deltaTime > maxDelta)
	{
	    if (deltaRestored)
	    { 
	        deltaTime = maxDelta;
	    }
	    else 
	    {
	        deltaRestored = true;
	        deltaTime = _prevDeltaTime;
	    }
	}
	else
	{
	    deltaRestored = false;
	}

	//---------------------------------
	// Update/Cache Time Scales
	//---------------------------------
	timeScales[0] = timeScale;
	timeScales[1] = timeScale*deltaTime;
	var _systemTimeScales = timeScales;

	//---------------------------------
	// Process Main Update Loop
	//---------------------------------
	if (isEnabled)
	{      
	    // Cache schedules list
	    var _schedules = schedules;  
	    // Increment system tick
	    tick++;
    
	    // While system tick is greater than the update interval
	    while(tick >= updateInterval)
	    {   
	        // Decrement system tick by update interval value
	        tick -= updateInterval;
        
	        // IF system timescale isn't "paused"
	        if (timeScale != 0)
	        {
	            //--------------------------------------------------
	            // Process Schedules
	            //--------------------------------------------------
	            // Set temporary index for schedules iteration
	            var _index = -1; 
	            //show_debug("61 size " + string(qs_list_size(_schedules)));
	            // Iterate through all schedules
	            repeat(qs_list_size(_schedules))
	            {
					//show_debug("65 index" + string(_index));
	                // Increment index and cache schedule
	                _schedule = _schedules[1][| ++_index];
					//show_debug("68 _schedule" + string(_schedule));
	                // Process schedule if instance active or schedule timer is forced
	                if (instance_exists(_schedule[SGMS_SCHEDULE.TARGET]) || _schedule[SGMS_SCHEDULE.FORCE_TIMER])
	                {
						//show_debug("72 _schedule");
	                    // IF schedule is active
	                    if (_schedule[SGMS_SCHEDULE.STATE])
	                    {
							//show_debug("76 _schedule");
	                        // Update schdules's time -- [use_seconds] boolean selects step/delta time scale
	                        _schedule[@ SGMS_SCHEDULE.TIME] -= _schedule[SGMS_SCHEDULE.TIME_SCALE]*_systemTimeScales[_schedule[SGMS_SCHEDULE.DELTA]];
                        
	                        // Check is schedule has expired
	                        if (_schedule[SGMS_SCHEDULE.TIME] <= 0)
	                        {
								//show_debug("83 _schedule[SGMS_SCHEDULE.ID] " + string(_schedule[SGMS_SCHEDULE.ID]));
	                            // Execute callback
	                            SGMS_ExecuteCallback(_schedule[SGMS_SCHEDULE.ID]);
	                            //show_debug("86 _schedule");
	                            // Decrement repeat counter and check if not zero
	                            if (_schedule[SGMS_SCHEDULE.REPEAT_COUNT] != 0)
	                            {
									//show_debug("90 _schedule");
	                                // Clamp repeat counter
	                                _schedule[@ SGMS_SCHEDULE.REPEAT_COUNT] = max(-1, _schedule[SGMS_SCHEDULE.REPEAT_COUNT] - 1);
	                                // Adjust timer for potential time overflow (maintains delta time sync)
	                                _schedule[@ SGMS_SCHEDULE.TIME] = _schedule[SGMS_SCHEDULE.DURATION] + _schedule[SGMS_SCHEDULE.TIME];
	                            }
	                            else
	                            {   
									//show_debug("98 - remove schedule index: " + string(_index));
	                                // Remove schedule from schedules list
	                                qs_list_delete(_schedules, _index--);
									//show_debug("101- remove schedule index: " + string(_index));
	                                // Invalidate schedule index handle
	                                qs_map_delete(global.SGMS_MAP_SCHEDULES, _schedule[SGMS_SCHEDULE.ID]);
	                                // Clear target instance
	                                _schedule[@ SGMS_SCHEDULE.TARGET] = noone;
	                                // Mark schedule as destroyed 
	                                _schedule[@ SGMS_SCHEDULE.STATE] = -1;
	                                // Nullify self referenced handle
	                                _schedule[@ SGMS_SCHEDULE.ID] = 0;
	                            }
	                        }
	                    }
	                }
	                else
	                {
						//show_debug("116 _schedule");
	                    // Attempt to activate instance for checking if it actually exists
	                    instance_activate_object(_schedule[SGMS_SCHEDULE.TARGET]);
                    
	                    // If it now exists...
	                    if (instance_exists(_schedule[SGMS_SCHEDULE.TARGET]))
	                    {
							//show_debug("123 _schedule");
	                        // Put it back to deactivated state... 
	                        instance_deactivate_object(_schedule[SGMS_SCHEDULE.TARGET]);
	                    }
	                    else
	                    {
							//show_debug("129 _schedule");
	                        // Remove schedule from schedules list
	                        qs_list_delete(_schedules, _index--);
	                        // Invalidate schedule index handle
	                        qs_map_delete(global.SGMS_MAP_SCHEDULES, _schedule[SGMS_SCHEDULE.ID]);
	                        // Clear target instance
	                        _schedule[@ SGMS_SCHEDULE.TARGET] = noone;
	                        // Mark schedule as destroyed 
	                        _schedule[@ SGMS_SCHEDULE.STATE] = -1;
	                        // Nullify self referenced handle
	                        _schedule[@ SGMS_SCHEDULE.ID] = 0;
	                    }
	                }
	            }
	        }
	    }
	}




}
