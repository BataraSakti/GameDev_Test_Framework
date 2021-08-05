
var tnn = object_get_name(object_index);
var tid = string(id);
var tpn = "";
var ttn = "";
var taid = string(action_id);
var tpev = string(_parent_event);
var ttev = string(_target_event);

if(is_imploding == true) { exit; }




if(_target != noone && !is_undefined(_target) && !is_undefined(_target_event) && _target_event != noone) {
    if(action_id != noone) {
        with(_target) {
			ttn = object_get_name(object_index);
            action_id = other.action_id;
            event_user(other._target_event);
        }
    } else {
        with(_target) {
			ttn = object_get_name(object_index);
            event_user(other._target_event);
        }
    }
}

if(_parent != noone && !is_undefined(_parent) && !is_undefined(_parent_event) && _parent_event != noone) {
    with(_parent) {
		tpn = object_get_name(object_index);
        event_user(other._parent_event);
    }
}

//After so we can catch the names of the target / parent 
show_debug("Button Clicked: " + tid + " : " + tnn + " :parent: " + tpn + " : " + tpev +	" :target: " + ttn + " : " + ttev + " :aid: " + taid);
