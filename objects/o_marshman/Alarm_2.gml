/// @description Finish update

if(string(dvalue) == string(danswer)) {
    ring_color = c_lime;
    answer_color = good_c;
    doSpeak = true; //Speak me if correct answer...
	
} else {
    ring_color = c_red;
    answer_color = bad_c;
}

