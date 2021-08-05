/// @description Read MG0 Data
show_debug("Read MG0 Data Event 7");

if(did_do_seven == false) {
    did_do_seven = true;
    
    ///load game data and start the game
    show_debug("----------------- READING MG0 DATA");
    
    scp_mg_0_read_game_data();
    event_user(0);
    ScheduleEventUser(id, true, 1, 10);
} else {
    show_debug("-!- -!- -!- ERROR EVENT SEVEN CALLED AGAIN MG0 -!- -!- -!-");
}

