///scp_free_surface(surface)
function scp_free_surface(argument0) {
	show_debug(object_get_name(object_index) + " freed surface " + string(argument0));
	if(surface_exists(argument0)) {
		surface_free(argument0);
	}


}
