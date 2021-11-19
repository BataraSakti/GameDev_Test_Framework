/// @description timer
timer--;
if (timer > 0){
	alarm[0] = room_speed * 1;
} else {
	finish_gameplay();
}
