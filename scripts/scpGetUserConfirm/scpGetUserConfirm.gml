/// @description scpGetUserConfirm(target, yes_text_key, yes_event_user, no_text_key, no_event_user, dialog_script, title_text_key, body_text_key, isAcknowledge, button_type, dialog_box_object[, extra_btn1_text, extra_btn1_event, must_show])
/// @function scpGetUserConfirm
/// @param target
/// @param  yes_text_key
/// @param  yes_event_user
/// @param  no_text_key
/// @param  no_event_user
/// @param  dialog_script
/// @param  title_text_key
/// @param  body_text_key
/// @param  isAcknowledge
/// @param  button_type
/// @param  dialog_box_object[
/// @param  extra_btn1_text
/// @param  extra_btn1_event
/// @param  must_show]
function scpGetUserConfirm() {

	//show_debug(object_get_name(id.object_index) + " is calling scpGetUserConfirm");

	var t__ = argument[0]; //Target
	var yes_text = "";
	if(argument[1] != "") {
	    yes_text = "yes";
	}
	var yes_event_user = argument[2];
	var no_text = "";
	if(argument[3] != "") {
	    no_text = "no";
	}
	var no_event_user = argument[4];
	var dialog_script = argument[5];
	var title_text = "";
	if(argument[6] != "") {
	    title_text = "Are you sure?";
		
	}
	var body_text = "";
	if(argument[7] != "") {
	    body_text = "";
		
	}
	var isAcknowledge = argument[8];
	var bType = argument[9];

	var dialog_box = argument[10];
	var dbo = noone;
	var ext1_text = "";
	var ext1_event = "";
	
	var must_show = false;
	if(argument_count >= 14){
		if (argument[13] != ""){
			must_show = true;
		}
	}

	if(instance_number(dialog_box) == 0) { 
	    dbo = instance_create_layer(view_wview[1] * 0.5, view_hview[1] * 0.5, global.layer_user_confirm, dialog_box);
	    if(instance_exists(dbo)) {
		    dbo.title = title_text;
		    dbo.body = body_text;
		    dbo.isAcknowledge = isAcknowledge;
		    dbo.bType = bType;
		    dbo.yes_event_user = yes_event_user;
		    dbo.yes_text = yes_text;
		    dbo.no_event_user = no_event_user;
		    dbo.no_text = no_text;
		    dbo.t__ = t__;
		    dbo.dialog_script = dialog_script;
    
		    if (argument_count >=  12){
		        dbo.ext_text = ext1_text;
		        dbo.ext_event_user = ext1_event;
		    }
			//show_debug(object_get_name(id.object_index) + " is calling scpGetUserConfirm and getting " 
			//	+ object_get_name(dbo.object_index) + " with ID " + string(dbo));
			show_debug("Create scpGetUserConfrim dialog " + object_get_name(dbo.object_index) + " with ID " + string(dbo));
		} else {
			//Failed to call dialog box...
			dbo = noone;
			show_debug("Failed to create scpGetUserConfrim dialog");
			if(must_show){
				destroy_instance(dialog_box);
				show_debug("recall the gui confirm");
				ScheduleScript(_mgc.id, false, 15, scpGetUserConfirm, t__, argument[1], yes_event_user,  argument[3], no_event_user, dialog_script, argument[6], 
							argument[7], isAcknowledge, bType, dialog_box, argument[11], ext1_event, must_show);
			}
		}
	} else {
	    dbo = noone;
		show_debug("Failed to create scpGetUserConfrim dialog - a dialog is already open");
		if(must_show){
			destroy_instance(dialog_box);
			show_debug("recall the gui confirm");
			ScheduleScript(_mgc.id, false, 15, scpGetUserConfirm, t__, argument[1], yes_event_user,  argument[3], no_event_user, dialog_script, argument[6], 
							argument[7], isAcknowledge, bType, dialog_box, argument[11], ext1_event, must_show);
		}
		//show_debug(object_get_name(id.object_index) + " is calling scpGetUserConfirm and getting noone");
	}

	//Incase we need to make more adjustments to it..	
	return dbo;



}
