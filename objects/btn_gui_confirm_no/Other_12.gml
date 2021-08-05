/// @description No 

show_debug("Calling gui confrim NO");

if(_parent != noone) {
    with(_parent) {
		show_debug(object_get_name(object_index) + " calling event " + string(other._parent_event));
        event_user(other._parent_event);
    }
}

