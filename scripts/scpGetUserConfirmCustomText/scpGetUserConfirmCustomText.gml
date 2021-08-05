/// @description scpGetUserConfirmCustomText(target, yes_text_key, yes_event_user, no_text_key, no_event_user, dialog_script, title_text_key, body_text_key, isAcknowledge, button_type, dialog_box_object[, extra_btn1_text, extra_btn1_event])
/// @function scpGetUserConfirmCustomText
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
/// @param  extra_btn1_event]
function scpGetUserConfirmCustomText() {

	var t__ = argument[0]; //Target
	var yes_text = "";
	if(argument[1] != "") {
	    yes_text = argument[1];
	}
	var yes_event_user = argument[2];
	var no_text = "";
	if(argument[3] != "") {
	    no_text = argument[3];
	}
	var no_event_user = argument[4];
	var dialog_script = argument[5];
	var title_text = "";
	if(argument[6] != "") {
	    title_text = argument[6];
	}
	var body_text = "";
	if(argument[7] != "") {
	    body_text = argument[7];
	    body_text = scp_split_at_nearest_char(body_text, 30);
	}
	var isAcknowledge = argument[8];
	var bType = argument[9];

	var dialog_box = argument[10];
	var dbo = noone;

	if (argument_count >= 12 ){
	    if (argument[11] != ""){
	        var ext1_text = argument[11];
	    }
    
	    var ext1_event = argument[12];
	}

	if(instance_number(dialog_box) == 0) { 
	    dbo = instance_create_layer(view_wview[1] * 0.5, view_hview[1] * 0.5, global.layer_modals, dialog_box);
    
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
	} else {
	    dbo = noone;
	}
	//Incase we need to make more adjustments to it..
	return dbo; 



}
