function SharedScheduler_Create() {
	//show_debug("Shared Scheduler Create");
	/// SharedScheduler_Create()
	
	

	// Set default global settings IF first time creating shared scheduler
	if (global.SGMS_FirstLoad)
	{   
	    global.SGMS_FirstLoad = false; // Prevent future default setup calls
	    global.SGMS_IsEnabled = true; // System's active state boolean
	    global.SGMS_TimeScale = 1.0; // Effects overall speed of how fast system plays
	    global.SGMS_MinDeltaFPS = 10; // The lowest framerate before delta schedules will begin to lag behind (Ideally, 10-15)
	    global.SGMS_UpdateInterval = 1.0; // Sets how often (in steps) system will update (1 = default, 2 = half speed, 0.5 = double speed) DO NOT set as 0 or below!
	}

	// Assign global values to instance variables
	isEnabled = global.SGMS_IsEnabled;
	timeScale = global.SGMS_TimeScale;
	minDeltaFPS = global.SGMS_MinDeltaFPS;
	updateInterval = global.SGMS_UpdateInterval;

	// System maintenance variables
	tick = 0; // System update timer
	keepPersistent = false; // Becomes true if used in persistent room
	maxDelta = 1/minDeltaFPS; // Cache delta cap
	deltaTime = delta_time/1000000; // Let's make delta time more practical to work with, shall we?
	deltaRestored = false; // Used to help maintain predictable delta timing
	timeScales[0] = timeScale;
	timeScales[1] = timeScale*deltaTime;

	// Data structures
	schedules = qs_list_create();
	pRoomSchedules = qs_map_create();




}
