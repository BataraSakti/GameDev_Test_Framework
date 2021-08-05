function SharedScheduler_Destroy() {
	//show_debug("Detroy Shared Scheduler");
	/// SharedScheduler_Destroy()

	//-------------------------------------------------
	// Destroy Schedules for Persistent Rooms
	//-------------------------------------------------
	ScheduleSystemClearAllRooms();

	//---------------------------------------------
	// Destroy remaining schedules
	//---------------------------------------------
	// Cache schedules
	var _schedules = schedules;
	// Cache schedules index map
	var _mapSchedules = global.SGMS_MAP_SCHEDULES;
	// Set index for schedule iteration
	var _index = qs_list_size(_schedules);

	repeat(_index)
	{   
	    // Cache schedule
	    var _schedule = _schedules[1][| --_index]; 
	    // Invalidate schedule index handle id
	    ds_map_delete(_mapSchedules, _schedule[9]);
	}

	//---------------------------------------
	// Remove self as shared singleton
	//---------------------------------------
	global.SGMS_SharedScheduler = noone;

	//---------------------------------------
	// Destroy Data Structures
	//---------------------------------------
	ds_list_destroy_safe(schedules);
	ds_map_destroy_safe(pRoomSchedules);




}
