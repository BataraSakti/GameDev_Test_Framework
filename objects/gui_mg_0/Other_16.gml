/// @description Spawn Marshmen

switch(display_stage) {
    case 1: {
        //Game Type 1 - Select the Leter / Number / Word spoken.
        show_debug("Spawn Marshmen 1");
		b_hint = createButtonTargeted(x, y - 105, elements_layer, btn_icon_center, id, 8, "", "" ,"", spr_btn_repeat_speak, 0.8);
		b_hint.icon = noone;
		//b_hint.icon_scale = 1.7;
		b_hint.p_xscale_dest = 0.8;
		b_hint.action_id = 0;
		
		
        //We just need to make X marshmen on the 2 levels using the preset values.
		/*Codes goes here*/
       
        break;
    }
    case 2: {
        //Game Type 2 - Select the words in the category.
        show_debug("Spawn Marshmen 2");
		
        //We just need to make X marshmen on the 2 levels using the preset values.
		 /*Codes goes here*/

        break;
    }
    case 3: {
        //Game Type 3 - Select the correct word to complete the sentance.
        show_debug("Spawn Marshmen 3");

        //We just need to make X marshmen on the 2 levels using the preset values.
         /*Codes goes here*/
        
        break;
    }
	case 4: {
        //Game Type 4 - For now its the same as Game 3 (27 April 2020)
        show_debug("Spawn Marshmen 3");

        //We just need to make X marshmen on the 2 levels using the preset values.
        /*Codes goes here*/
        
        break;
    }
    case 5: {
        //Game Type 5 - Build a sentance from the provided words
        show_debug("Spawn Marshmen 4");
        
        //We just need to make X marshmen on the 2 levels using the preset values.
         /*Codes goes here*/

        break;
    }
	case 6:{
		draw_question_game6 = true;
		//We just need to make X marshmen on the 2 levels using the preset values.
        show_debug("Spawn Marshmen 1");
		trial = false;
        //We just need to make X marshmen on the 2 levels using the preset values.
       /*Codes goes here*/
        break;
	}
}
