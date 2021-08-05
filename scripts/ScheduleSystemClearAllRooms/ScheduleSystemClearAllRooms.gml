/// @description  ScheduleSystemClearAllRooms()
/// @function  ScheduleSystemClearAllRooms
function ScheduleSystemClearAllRooms() {
	// Clears schedule data from all persistent rooms

	var _pRoomSchedules = SharedScheduler().pRoomSchedules;

	// Clear and destroy schedules
	repeat(qs_map_size(_pRoomSchedules))
	{
	    var _key = qs_map_find_first(_pRoomSchedules);
	    var _queue = qs_map_find_value(_pRoomSchedules, _key);
    
	    repeat(ds_queue_size(_queue))
	    {
	        var _schedule = ds_queue_dequeue(_queue);
	        {   
	            // Invalidate schedule handle
	            qs_map_delete(global.SGMS_MAP_SCHEDULES, _schedule[9]);
	        }
	    }
    
	    ds_queue_destroy(_queue);
	    qs_map_delete(_pRoomSchedules, _key);
	}
}
