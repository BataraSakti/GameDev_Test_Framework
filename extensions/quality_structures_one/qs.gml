#define qs_init
//#macro qs_debug_mode true
// type markers:
global.g_qs_type_t = ["qs"];
global.g_qs_stack_t = [global.g_qs_type_t, "stack"];
global.g_qs_queue_t = [global.g_qs_type_t, "queue"];
global.g_qs_list_t = [global.g_qs_type_t, "list"];
global.g_qs_map_t = [global.g_qs_type_t, "map"];
global.g_qs_priority_t = [global.g_qs_type_t, "priority"];
global.g_qs_grid_t = [global.g_qs_type_t, "grid"];
// magic error value for JSON decoder:
global.g_qs_error_t = ["qs::error"];
global.g_qs_error = [global.g_qs_error_t, -1, undefined];
//
global.g_qs_mark_t = ["qs::mark"];
global.g_qs_has_mark_t = ["qs::has_mark"];
global.g_qs_active_maps = ds_map_create();
global.g_qs_active_lists = ds_map_create();
global.g_qs_active_grids = ds_map_create();
global.g_qs_active_queues = ds_map_create();
global.g_qs_active_stacks = ds_map_create();
global.g_qs_active_priorities = ds_map_create();
//
global.g_qs_impl_base16_list = -1;
global.g_qs_impl_base16_stack1 = -1;
global.g_qs_impl_base16_stack2 = -1;
global.g_qs_impl_base16_map = -1;
global.g_qs_impl_base16_grid = -1;
global.g_qs_pair_t = ["qs::xy"];
global.g_qs_pairs = ds_stack_create();
//#global qs_debug_callstack
qs_debug_callstack = true;
//#global qs_debug_active
qs_debug_active = false;
//#global qs_debug_json_encode
qs_debug_json_encode = 1;
//#global qs_debug_base16_write
qs_debug_base16_write = 1;
//#global qs_option_max_json_depth
qs_option_max_json_depth = 100;
//#global qs_option_no_json_mark
qs_option_no_json_mark = false;
//#macro qs_json_error -1

//#macro qs_type_map ds_type_map
//#macro qs_type_list ds_type_list
//#macro qs_type_stack ds_type_stack
//#macro qs_type_queue ds_type_queue
//#macro qs_type_grid ds_type_grid
//#macro qs_type_priority ds_type_priority

// Generated at 2019-09-05 19:44:29 (1313ms) for v2.2.1+
globalvar qs_json_std_mathnf_not_a_number;qs_json_std_mathnf_not_a_number=qs_json_std_mathnf_init(0,0);
globalvar g_qs_json_buffer;g_qs_json_buffer=buffer_create(128,buffer_grow,1);
globalvar g_qs_json_strbuf;g_qs_json_strbuf=buffer_create(128,buffer_grow,1);
globalvar g_qs_json_offset;
globalvar g_qs_json_length;
globalvar g_qs_json_error_text;
globalvar g_qs_json_encode_str_esc;
var l_e=array_create(256,-1);
l_e[@34]=34;
l_e[@92]=92;
l_e[@9]=116;
l_e[@13]=114;
l_e[@10]=110;
l_e[@8]=98;
l_e[@12]=102;
g_qs_json_encode_str_esc=l_e;

#define qs_xy
// (x, y)
var l_pair;
if (ds_stack_empty(global.g_qs_pairs)) {
	return [global.g_qs_pair_t, argument0, argument1];
	/*
	l_pair = array_create(3);
	l_pair[0] = global.g_qs_pair_t;
	l_pair[1] = argument0;
	l_pair[2] = argument1;
	return l_pair;
	*/
} else {
	l_pair = ds_stack_pop(global.g_qs_pairs);
	l_pair[@1] = argument0;
	l_pair[@2] = argument1;
	return l_pair;
}

#define qs_get
// (source, ...indexes)
var l_val = argument[0];
var l_ind = 0;
repeat (argument_count - 1) {
	var l_key = argument[++l_ind];
	if (is_string(l_key)) {
		l_val = qs_map_find_value(l_val, l_key);
	} else if (is_real(l_key) || is_int32(l_key) || is_int64(l_key) || is_bool(l_key)) {
		l_val = qs_list_find_value(l_val, l_key);
	} else if (array_length_1d(l_key) == 3 && l_key[0] == global.g_qs_pair_t) {
		l_val = qs_grid_get(l_val, l_key[1], l_key[2]);
		ds_stack_push(global.g_qs_pairs, l_key);
	} else if (array_length_1d(l_key) == 2) {
		l_val = qs_grid_get(l_val, l_key[0], l_key[1]);
	} else {
		show_error(string(l_key) + "(argument[" + string(l_ind) + "]) is not a valid index.", true);
	}
}
return l_val;

#define qs_set
// (source, ...indexes; value)
var l_val = argument[0];
var l_ind = 0, l_key;
repeat (argument_count - 3) {
	l_key = argument[++l_ind];
	if (is_string(l_key)) {
		l_val = qs_map_find_value(l_val, l_key);
	} else if (is_real(l_key) || is_int32(l_key) || is_int64(l_key) || is_bool(l_key)) {
		l_val = qs_list_find_value(l_val, l_key);
	} else if (array_length_1d(l_key) == 3 && l_key[0] == global.g_qs_pair_t) {
		l_val = qs_grid_get(l_val, l_key[1], l_key[2]);
		ds_stack_push(global.g_qs_pairs, l_key);
	} else if (array_length_1d(l_key) == 2) {
		l_val = qs_grid_get(l_val, l_key[0], l_key[1]);
	} else {
		show_error(string(l_key) + "(argument[" + string(l_ind) + "]) is not a valid index.", true);
	}
}
// set:
l_key = argument[++l_ind];
var l_new = argument[++l_ind];
if (is_string(l_key)) {
	qs_map_set(l_val, l_key, l_new);
} else if (is_real(l_key) || is_int32(l_key) || is_int64(l_key) || is_bool(l_key)) {
	qs_list_set(l_val, l_key, l_new);
} else if (array_length_1d(l_key) == 3 && l_key[0] == global.g_qs_pair_t) {
	qs_grid_set(l_val, l_key[1], l_key[2], l_new);
	ds_stack_push(global.g_qs_pairs, l_key);
} else if (array_length_1d(l_key) == 2) {
	qs_grid_set(l_val, l_key[0], l_key[1], l_new);
} else {
	show_error(string(l_key) + "(argument[" + string(l_ind) + "]) is not a valid index.", true);
}

//{ map adj
#define qs_map_inc_post
// (map, key)
var val = qs_map_find_value(argument0, argument1);
qs_map_set(argument0, argument1, val + 1);
return val;

#define qs_map_dec_post
// (map, key)
var val = qs_map_find_value(argument0, argument1);
qs_map_set(argument0, argument1, val - 1);
return val;

#define qs_map_pre
// (map, key)
global.g_qs_map_aop_map = argument0;
global.g_qs_map_aop_key = argument1;
return qs_map_find_value(argument0, argument1);

#define qs_map_post
// (value)
qs_map_set(global.g_qs_map_aop_map, global.g_qs_map_aop_key, argument0);
global.g_qs_map_aop_map = undefined;
global.g_qs_map_aop_key = undefined;
//}

//{ list adj
#define qs_list_inc_post
// (list, index)
var val = qs_list_find_value(argument0, argument1);
qs_list_set(argument0, argument1, val + 1);
return val;

#define qs_list_dec_post
// (list, index)
var val = qs_list_find_value(argument0, argument1);
qs_list_set(argument0, argument1, val - 1);
return val;

#define qs_list_pre
// (list, index)
global.g_qs_list_aop_list = argument0;
global.g_qs_list_aop_index = argument1;
return qs_list_find_value(argument0, argument1);

#define qs_list_post
// (value)
qs_list_set(global.g_qs_list_aop_list, global.g_qs_list_aop_index, argument0);
global.g_qs_list_aop_list = undefined;
global.g_qs_list_aop_index = undefined;
//}

//{ grid adj
#define qs_grid_inc_post
// (grid, x, y)
var val = qs_grid_get(argument0, argument1, argument2);
qs_grid_set(argument0, argument1, argument2, val + 1);
return val;

#define qs_grid_dec_post
// (grid, x, y)
var val = qs_grid_get(argument0, argument1, argument2);
qs_grid_set(argument0, argument1, argument2, val - 1);
return val;

#define qs_grid_pre
// (grid, x, y)
global.g_qs_grid_aop_grid = argument0;
global.g_qs_grid_aop_x = argument1;
global.g_qs_grid_aop_x = argument2;
return qs_grid_get(argument0, argument1, argument2);

#define qs_grid_post
// (value)
qs_grid_set(global.g_qs_grid_aop_grid, global.g_qs_grid_aop_x, global.g_qs_grid_aop_y, argument0);
global.g_qs_grid_aop_grid = undefined;
global.g_qs_grid_aop_x = undefined;
global.g_qs_grid_aop_y = undefined;
//}

#define qs_debug_dump
// (qs_value)->string
repeat (1) {
	if (array_length_1d(argument0) < 3) break;
	var l_meta = argument0[0];
	if (array_length_1d(l_meta) < 2) break;
	if (l_meta[0] != global.g_qs_type_t) break;
	var l_val = argument0[1];
	var l_msg = "qs::" + l_meta[1] + " (id " + string(l_val) + ")";
	var l_stack = argument0[2];
	if (is_array(l_stack)) {
		l_msg += ", " + (l_val >= 0 ? "created" : "destroyed") + " from";
		var l_ind = -1;
		repeat (array_length_1d(l_stack)) {
			var l_item = l_stack[++l_ind];
			if (is_string(l_item)) {
				l_msg += chr(13) + chr(10) + "  " + l_item;
			}
		}
	}
	return l_msg;
}
return "`" + string(argument0) + "` (" + typeof(argument0) + ")";

#define qs_exists
// (id, ds_type)
var l_meta;
switch (argument1) {
	case ds_type_map: l_meta = global.g_qs_map_t; break;
	case ds_type_list: l_meta = global.g_qs_list_t; break;
	case ds_type_grid: l_meta = global.g_qs_grid_t; break;
	case ds_type_stack: l_meta = global.g_qs_stack_t; break;
	case ds_type_queue: l_meta = global.g_qs_queue_t; break;
	case ds_type_priority: l_meta = global.g_qs_priority_t; break;
	default:
		show_error("Not a known ds_type `" + string(argument1) + "` for qs_exists", true);
		return false;
}
return array_length_1d(argument0) > 2 && argument0[0] == l_meta && ds_exists(argument0[1], argument1);

#define qs_get_index
// (id)
var l_val = argument[0];
if (array_length_1d(l_val)) {
	var l_meta = l_val[0];
	if (array_length_1d(l_meta) && l_meta[0] == global.g_qs_type_t) {
		var l_against;
		switch (argument[1]) {
			case ds_type_map:      l_against = global.g_qs_map_t; break;
			case ds_type_list:     l_against = global.g_qs_list_t; break;
			case ds_type_grid:     l_against = global.g_qs_grid_t; break;
			case ds_type_stack:    l_against = global.g_qs_stack_t; break;
			case ds_type_queue:    l_against = global.g_qs_queue_t; break;
			case ds_type_priority: l_against = global.g_qs_priority_t; break;
			default:
				show_error("Not a known ds_type `" + string(argument[1]) + "` for qs_get_index", true);
				return l_val[1];
		}
		if (l_meta != l_against) show_error("Type mismatch - expected "
			+ string(l_against[1]) + ", got " + string(l_meta[1]), true);
		return l_val[1];
	}
}
return l_val;

//{ rest

#define qs_stack_push
// (stack, ...values)
var l_wrap = argument[0];
if (array_length_1d(l_wrap) > 2 && l_wrap[0] == global.g_qs_stack_t) {
	var l_stack = l_wrap[1];
	if (l_stack >= 0) {
		var l_ind = 0;
		repeat (argument_count - 1) {
			ds_stack_push(l_stack, argument[++l_ind]);
		}
	} else qs_impl_stack_amiss(l_wrap);
} else qs_impl_stack_mismatch(l_wrap);

#define qs_queue_enqueue
// (queue, ...values)
var l_wrap = argument[0];
if (array_length_1d(l_wrap) > 2 && l_wrap[0] == global.g_qs_queue_t) {
	var l_queue = l_wrap[1];
	if (l_queue >= 0) {
		var l_ind = 0;
		repeat (argument_count - 1) {
			ds_queue_enqueue(l_queue, argument[++l_ind]);
		}
	} else qs_impl_queue_amiss(l_wrap);
} else qs_impl_queue_mismatch(l_wrap);

#define qs_list_add
// (list, ...values)
var l_wrap = argument[0];
if (array_length_1d(l_wrap) > 2 && l_wrap[0] == global.g_qs_list_t) {
	var l_list = l_wrap[1];
	if (l_list >= 0) {
		var l_ind = 0;
		repeat (argument_count - 1) {
			ds_list_add(l_list, argument[++l_ind]);
		}
	} else qs_impl_list_amiss(l_wrap);
} else qs_impl_list_mismatch(l_wrap);

//}

//{ map-nest

#define qs_map_destroy
// (map)
var l_sizeof = array_length_1d(argument0);
if (l_sizeof > 2 && argument0[0] == global.g_qs_map_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		if (l_sizeof > 3 && argument0[3] == global.g_qs_has_mark_t) {
			var l_key = ds_map_find_first(l_map);
			repeat (ds_map_size(l_map)) {
				var l_val = l_map[?l_key];
				if (array_length_1d(l_val) > 1 && l_val[0] == global.g_qs_mark_t) {
					l_val = l_val[1];
					if (l_val < 0) {
						// already destroyed
					} else if (l_val[0] == global.g_qs_map_t) {
						qs_map_destroy(l_val);
					} else {
						qs_list_destroy(l_val);
					}
				}
				l_key = ds_map_find_next(l_map, l_key);
			}
		}
		ds_map_destroy(l_map);
		if (qs_debug_active) ds_map_delete(global.g_qs_active_maps, argument0[1]);
		argument0[@1] = -1;
		argument0[@2] = qs_debug_callstack ? debug_get_callstack() : undefined;
	} else qs_impl_map_amiss(argument0);
} else qs_impl_map_mismatch(argument0);

#define qs_map_find_value
// (map, key)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_map_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		var l_item = ds_map_find_value(l_map, argument1);
		if (array_length_1d(l_item) > 1 && l_item[0] == global.g_qs_mark_t) l_item = l_item[1];
		return l_item;
	} else qs_impl_map_amiss(argument0);
} else qs_impl_map_mismatch(argument0);

#define qs_map_add_map
// (id, key, map_value)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_map_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		if (array_length_1d(argument2) > 2 && argument2[0] == global.g_qs_map_t) {
			var l_val = argument2[1];
			if (l_val >= 0) {
				ds_map_add(l_map, argument1, [global.g_qs_mark_t, argument2]);
				argument0[@3] = global.g_qs_has_mark_t;
			} else qs_impl_map_amiss(argument2);
		} else qs_impl_map_mismatch(argument2);
	} else qs_impl_map_amiss(argument0);
} else qs_impl_map_mismatch(argument0);

#define qs_map_replace_map
// (id, key, map_value)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_map_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		if (array_length_1d(argument2) > 2 && argument2[0] == global.g_qs_map_t) {
			var l_val = argument2[1];
			if (l_val >= 0) {
				ds_map_replace(l_map, argument1, [global.g_qs_mark_t, argument2]);
				argument0[@3] = global.g_qs_has_mark_t;
			} else qs_impl_map_amiss(argument2);
		} else qs_impl_map_mismatch(argument2);
	} else qs_impl_map_amiss(argument0);
} else qs_impl_map_mismatch(argument0);

#define qs_map_add_list
// (id, key, list_value)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_map_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		if (array_length_1d(argument2) > 2 && argument2[0] == global.g_qs_list_t) {
			var l_val = argument2[1];
			if (l_val >= 0) {
				ds_map_add(l_map, argument1, [global.g_qs_mark_t, argument2]);
				argument0[@3] = global.g_qs_has_mark_t;
			} else qs_impl_list_amiss(argument2);
		} else qs_impl_list_mismatch(argument2);
	} else qs_impl_map_amiss(argument0);
} else qs_impl_map_mismatch(argument0);

#define qs_map_replace_list
// (id, key, list_value)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_map_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		if (array_length_1d(argument2) > 2 && argument2[0] == global.g_qs_list_t) {
			var l_val = argument2[1];
			if (l_val >= 0) {
				ds_map_replace(l_map, argument1, [global.g_qs_mark_t, argument2]);
				argument0[@3] = global.g_qs_has_mark_t;
			} else qs_impl_list_amiss(argument2);
		} else qs_impl_list_mismatch(argument2);
	} else qs_impl_map_amiss(argument0);
} else qs_impl_map_mismatch(argument0);

//}

//{ list-nest

#define qs_list_destroy
// (list)
var l_sizeof = array_length_1d(argument0);
if (l_sizeof && argument0[0] == global.g_qs_list_t) {
	var l_list = argument0[1];
	if (l_list >= 0) {
		if (l_sizeof > 3 && argument0[3] == global.g_qs_has_mark_t) {
			var l_ind = -1;
			repeat (ds_list_size(l_list)) {
				var l_val = l_list[|++l_ind];
				if (array_length_1d(l_val) > 1 && l_val[0] == global.g_qs_mark_t) {
					l_val = l_val[1];
					if (l_val < 0) {
						// already destroyed
					} else if (l_val[0] == global.g_qs_map_t) {
						qs_map_destroy(l_val);
					} else {
						qs_list_destroy(l_val);
					}
				}
			}
		}
		ds_list_destroy(argument0[1]);
		if (qs_debug_active) ds_map_delete(global.g_qs_active_lists, argument0[1]);
		argument0[@1] = -1;
		argument0[@2] = qs_debug_callstack ? debug_get_callstack() : undefined;
	} else qs_impl_list_amiss(argument0);
} else qs_impl_list_mismatch(argument0);

#define qs_list_find_value
// (id, pos)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_list_t) {
	var l_list = argument0[1];
	if (l_list >= 0) {
		var l_val = l_list[|argument1];
		if (array_length_1d(l_val) > 1 && l_val[0] == global.g_qs_mark_t) l_val = l_val[1];
		return l_val;
	} else qs_impl_list_amiss(argument0);
} else qs_impl_list_mismatch(argument0);

#define qs_list_find_index
// (id, val)
var l_sizeof = array_length_1d(argument0);
if (l_sizeof > 2 && argument0[0] == global.g_qs_list_t) {
	var l_list = argument0[1];
	if (l_list >= 0) {
		if (l_sizeof > 3 && argument0[3] == global.g_qs_has_mark_t) {
			// not as fast but what to do
			var l_ind = -1;
			repeat (ds_list_size(l_list)) {
				var l_val = l_list[|++l_ind];
				if (array_length_1d(l_val) > 1 && l_val[0] == global.g_qs_mark_t) l_val = l_val[1];
				if (l_val == argument1) return l_ind;
			}
			return -1;
		} else {
			return ds_list_find_index(l_list, argument1);
		}
	} else qs_impl_list_amiss(argument0);
} else qs_impl_list_mismatch(argument0);

#define qs_list_mark_as_list
// (id, pos)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_list_t) {
	var l_list = argument0[1];
	if (l_list >= 0) {
		var l_val = l_list[|argument1];
		if (array_length_1d(l_val) > 2 && l_val[0] == global.g_qs_list_t) {
			if (l_val[1] >= 0) {
				l_list[|argument1] = [global.g_qs_mark_t, l_val];
				argument0[@3] = global.g_qs_has_mark_t;
			} else qs_impl_list_amiss(l_val);
		} else qs_impl_list_mismatch(l_val);
	} else qs_impl_list_amiss(argument0);
} else qs_impl_list_mismatch(argument0);

#define qs_list_mark_as_map
// (id, pos)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_list_t) {
	var l_list = argument0[1];
	if (l_list >= 0) {
		var l_val = l_list[|argument1];
		if (array_length_1d(l_val) > 2 && l_val[0] == global.g_qs_map_t) {
			if (l_val[1] >= 0) {
				l_list[|argument1] = [global.g_qs_mark_t, l_val];
				argument0[@3] = global.g_qs_has_mark_t;
			} else qs_impl_map_amiss(l_val);
		} else qs_impl_map_mismatch(l_val);
	} else qs_impl_list_amiss(argument0);
} else qs_impl_list_mismatch(argument0);

//}

//{ _write
#define qs_impl_base16_unwrap
// (value)~
var l_val = argument0;
if (array_length_1d(l_val)) {
	var l_meta = l_val[0];
	if (array_length_1d(l_meta) && l_meta[0] == global.g_qs_type_t) {
		var l_lv = qs_debug_base16_write;
		if (l_lv > 0) {
			var l_msg = "_write functions do not support nested structures, this will be written as a number: `" + string(l_val) + "` (" + typeof(l_val) + ")";
			if (l_lv > 1) {
				show_error(l_msg, l_lv > 2);
			} else show_debug_message(l_msg);
		}
		return l_val[1];
	}
}
return l_val;

#define qs_stack_write
// (stack)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_stack_t) {
	var l_stack = argument0[1];
	if (l_stack >= 0) {
		var l_tmp1 = global.g_qs_impl_base16_stack1;
		var l_tmp2 = global.g_qs_impl_base16_stack2;
		if (l_tmp1 < 0) {
			l_tmp1 = ds_stack_create();
			global.g_qs_impl_base16_stack1 = l_tmp1;
			l_tmp2 = ds_stack_create();
			global.g_qs_impl_base16_stack2 = l_tmp2;
		} else {
			ds_stack_clear(l_tmp1);
			ds_stack_clear(l_tmp2);
		}
		//
		var l_size = ds_stack_size(l_stack);
		ds_stack_copy(l_tmp1, l_stack);
		repeat (l_size) ds_stack_push(l_tmp2, qs_impl_base16_unwrap(ds_stack_pop(l_tmp1)));
		repeat (l_size) ds_stack_push(l_tmp1, ds_stack_pop(l_tmp2));
		//
		var l_str = ds_stack_write(l_tmp1);
		ds_stack_clear(l_tmp1);
		return l_str;
	} else qs_impl_stack_amiss(argument0);
} else qs_impl_stack_mismatch(argument0);

#define qs_list_write
// (list)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_list_t) {
	var l_list = argument0[1];
	if (l_list >= 0) {
		var l_tmp = global.g_qs_impl_base16_list;
		if (l_tmp < 0) {
			l_tmp = ds_list_create();
			global.g_qs_impl_base16_list = l_tmp;
		} else ds_list_clear(l_tmp);
		//
		var l_size = ds_list_size(l_list);
		for (var l_pos = 0; l_pos < l_size; l_pos++) {
			ds_list_add(l_tmp, qs_impl_base16_unwrap(l_list[|l_pos]));
		}
		//
		var l_str = ds_list_write(l_tmp);
		ds_list_clear(l_tmp);
		return l_str;
	} else qs_impl_list_amiss(argument0);
} else qs_impl_list_mismatch(argument0);

#define qs_grid_write
// (grid)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		var l_w = ds_grid_width(l_grid);
		var l_h = ds_grid_height(l_grid);
		var l_tmp = global.g_qs_impl_base16_grid;
		if (l_tmp < 0) {
			l_tmp = ds_grid_create(l_w, l_h);
			global.g_qs_impl_base16_grid = l_tmp;
		} else if (ds_grid_width(l_tmp) != l_w || ds_grid_height(l_tmp) != l_h) {
			ds_grid_resize(l_tmp, l_w, l_h);
		}
		//
		for (var l_x = 0; l_x < l_w; l_x++)
		for (var l_y = 0; l_y < l_h; l_y++) {
			l_tmp[#l_x,l_y] = qs_impl_base16_unwrap(l_grid[#l_x,l_y]);
		}
		//
		var l_str = ds_grid_write(l_tmp);
		ds_grid_clear(l_tmp, 0);
		return l_str;
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_map_write
// (map)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_map_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		var l_tmp = global.g_qs_impl_base16_map;
		if (l_tmp < 0) {
			l_tmp = ds_map_create();
			global.g_qs_impl_base16_map = l_tmp;
		} else ds_map_clear(l_tmp);
		//
		var l_key = ds_map_find_first(l_map);
		repeat (ds_map_size(l_map)) {
			l_tmp[?qs_impl_base16_unwrap(l_key)] = qs_impl_base16_unwrap(l_map[?l_key]);
			l_key = ds_map_find_next(l_map, l_key);
		}
		//
		var l_str = ds_map_write(l_tmp);
		ds_map_clear(l_tmp);
		return l_str;
	} else qs_impl_map_amiss(argument0);
} else qs_impl_map_mismatch(argument0);

#define qs_grid_set_grid_region
// (id,source,x1,y1,x2,y2,xpos,ypos)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_one = argument0[1];
	if (l_one >= 0) {
		if (array_length_1d(argument1) > 2 && argument1[0] == global.g_qs_grid_t) {
			var l_two = argument1[1];
			if (l_two >= 0) {
				ds_grid_set_grid_region(l_one, l_two, argument2, argument3, argument4, argument5, argument6, argument7);
			} else qs_impl_grid_amiss(argument1);
		} else qs_impl_grid_mismatch(argument1);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_add_grid_region
// (id,source,x1,y1,x2,y2,xpos,ypos)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_one = argument0[1];
	if (l_one >= 0) {
		if (array_length_1d(argument1) > 2 && argument1[0] == global.g_qs_grid_t) {
			var l_two = argument1[1];
			if (l_two >= 0) {
				ds_grid_add_grid_region(l_one, l_two, argument2, argument3, argument4, argument5, argument6, argument7);
			} else qs_impl_grid_amiss(argument1);
		} else qs_impl_grid_mismatch(argument1);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_multiply_grid_region
// (id,source,x1,y1,x2,y2,xpos,ypos)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_one = argument0[1];
	if (l_one >= 0) {
		if (array_length_1d(argument1) > 2 && argument1[0] == global.g_qs_grid_t) {
			var l_two = argument1[1];
			if (l_two >= 0) {
				ds_grid_multiply_grid_region(l_one, l_two, argument2, argument3, argument4, argument5, argument6, argument7);
			} else qs_impl_grid_amiss(argument1);
		} else qs_impl_grid_mismatch(argument1);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_map_secure_save
// (map, filename)
var l_tmp = json_decode(qs_json_encode(argument0));
var l_result = ds_map_secure_save(l_tmp, argument1);
ds_map_destroy(l_tmp);
return l_result;

#define qs_map_secure_save_buffer
// (map, buffer)
var l_tmp = json_decode(qs_json_encode(argument0));
var l_result = ds_map_secure_save_buffer(l_tmp, argument1);
ds_map_destroy(l_tmp);
return l_result;

#define qs_map_secure_load
// (filename)
var l_tmp = ds_map_secure_load(argument0);
if (l_tmp < 0) return l_tmp;
var l_result = qs_json_decode(json_encode(l_tmp));
ds_map_destroy(l_tmp);
return l_result;

#define qs_map_secure_load_buffer
// (buffer)
var l_tmp = ds_map_secure_load_buffer(argument0);
if (l_tmp < 0) return l_tmp;
var l_result = qs_json_decode(json_encode(l_tmp));
ds_map_destroy(l_tmp);
return l_result;

//}

// ... the rest of this file is auto-generated
#define qs_impl_stack_amiss
// (value)~
var l_stack = argument0[2], l_msg;
if (is_array(l_stack)) {
	l_msg = "This stack is already destroyed from:";
	var l_ind = -1;
	repeat (array_length_1d(l_stack)) {
		var l_item = l_stack[++l_ind];
		if (is_string(l_item)) {
			l_msg += chr(13) + chr(10) + "  " + l_item;
		}
	}
} else {
	l_msg = "This stack is already destroyed."
		+ chr(13) + chr(10) + "(qs_debug_callstack is disabled)";
}
show_error(l_msg, true);

#define qs_impl_stack_mismatch
// (value)~
show_error("Expected a stack, got " + qs_debug_dump(argument0), true);

#define qs_stack_create
// ()
var l_stack = [
	global.g_qs_stack_t,
	ds_stack_create(),
	qs_debug_callstack ? debug_get_callstack() : undefined,
];
if (qs_debug_active) global.g_qs_active_stacks[?l_stack[1]] = l_stack[2];
return l_stack;

#define qs_stack_destroy
// (stack)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_stack_t) {
	var l_stack = argument0[1];
	if (l_stack >= 0) {
		ds_stack_destroy(argument0[1]);
		if (qs_debug_active) ds_map_delete(global.g_qs_active_stacks, argument0[1]);
		argument0[@1] = -1;
		argument0[@2] = qs_debug_callstack ? debug_get_callstack() : undefined;
	} else qs_impl_stack_amiss(argument0);
} else qs_impl_stack_mismatch(argument0);

#define qs_stack_clear
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_stack_t) {
	var l_stack = argument0[1];
	if (l_stack >= 0) {
		ds_stack_clear(l_stack);
	} else qs_impl_stack_amiss(argument0);
} else qs_impl_stack_mismatch(argument0);

#define qs_stack_copy
// (id, source)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_stack_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		if (array_length_1d(argument1) > 2 && argument1[0] == global.g_qs_stack_t) {
			var l_val = argument1[1];
			if (l_val >= 0) {
				ds_stack_copy(l_map, l_val);
			} else qs_impl_stack_amiss(argument1);
		} else qs_impl_stack_mismatch(argument1);
	} else qs_impl_stack_amiss(argument0);
} else qs_impl_stack_mismatch(argument0);

#define qs_stack_size
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_stack_t) {
	var l_stack = argument0[1];
	if (l_stack >= 0) {
		return ds_stack_size(l_stack);
	} else qs_impl_stack_amiss(argument0);
} else qs_impl_stack_mismatch(argument0);

#define qs_stack_empty
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_stack_t) {
	var l_stack = argument0[1];
	if (l_stack >= 0) {
		return ds_stack_empty(l_stack);
	} else qs_impl_stack_amiss(argument0);
} else qs_impl_stack_mismatch(argument0);

#define qs_stack_pop
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_stack_t) {
	var l_stack = argument0[1];
	if (l_stack >= 0) {
		return ds_stack_pop(l_stack);
	} else qs_impl_stack_amiss(argument0);
} else qs_impl_stack_mismatch(argument0);

#define qs_stack_top
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_stack_t) {
	var l_stack = argument0[1];
	if (l_stack >= 0) {
		return ds_stack_top(l_stack);
	} else qs_impl_stack_amiss(argument0);
} else qs_impl_stack_mismatch(argument0);

#define qs_stack_read
// (id,str)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_stack_t) {
	var l_stack = argument0[1];
	if (l_stack >= 0) {
		ds_stack_read(l_stack, argument1);
	} else qs_impl_stack_amiss(argument0);
} else qs_impl_stack_mismatch(argument0);

#define qs_impl_queue_amiss
// (value)~
var l_stack = argument0[2], l_msg;
if (is_array(l_stack)) {
	l_msg = "This queue is already destroyed from:";
	var l_ind = -1;
	repeat (array_length_1d(l_stack)) {
		var l_item = l_stack[++l_ind];
		if (is_string(l_item)) {
			l_msg += chr(13) + chr(10) + "  " + l_item;
		}
	}
} else {
	l_msg = "This queue is already destroyed."
		+ chr(13) + chr(10) + "(qs_debug_callstack is disabled)";
}
show_error(l_msg, true);

#define qs_impl_queue_mismatch
// (value)~
show_error("Expected a queue, got " + qs_debug_dump(argument0), true);

#define qs_queue_create
// ()
var l_queue = [
	global.g_qs_queue_t,
	ds_queue_create(),
	qs_debug_callstack ? debug_get_callstack() : undefined,
];
if (qs_debug_active) global.g_qs_active_queues[?l_queue[1]] = l_queue[2];
return l_queue;

#define qs_queue_destroy
// (queue)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_queue_t) {
	var l_queue = argument0[1];
	if (l_queue >= 0) {
		ds_queue_destroy(argument0[1]);
		if (qs_debug_active) ds_map_delete(global.g_qs_active_queues, argument0[1]);
		argument0[@1] = -1;
		argument0[@2] = qs_debug_callstack ? debug_get_callstack() : undefined;
	} else qs_impl_queue_amiss(argument0);
} else qs_impl_queue_mismatch(argument0);

#define qs_queue_clear
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_queue_t) {
	var l_queue = argument0[1];
	if (l_queue >= 0) {
		ds_queue_clear(l_queue);
	} else qs_impl_queue_amiss(argument0);
} else qs_impl_queue_mismatch(argument0);

#define qs_queue_copy
// (id, source)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_queue_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		if (array_length_1d(argument1) > 2 && argument1[0] == global.g_qs_queue_t) {
			var l_val = argument1[1];
			if (l_val >= 0) {
				ds_queue_copy(l_map, l_val);
			} else qs_impl_queue_amiss(argument1);
		} else qs_impl_queue_mismatch(argument1);
	} else qs_impl_queue_amiss(argument0);
} else qs_impl_queue_mismatch(argument0);

#define qs_queue_size
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_queue_t) {
	var l_queue = argument0[1];
	if (l_queue >= 0) {
		return ds_queue_size(l_queue);
	} else qs_impl_queue_amiss(argument0);
} else qs_impl_queue_mismatch(argument0);

#define qs_queue_empty
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_queue_t) {
	var l_queue = argument0[1];
	if (l_queue >= 0) {
		return ds_queue_empty(l_queue);
	} else qs_impl_queue_amiss(argument0);
} else qs_impl_queue_mismatch(argument0);

#define qs_queue_dequeue
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_queue_t) {
	var l_queue = argument0[1];
	if (l_queue >= 0) {
		return ds_queue_dequeue(l_queue);
	} else qs_impl_queue_amiss(argument0);
} else qs_impl_queue_mismatch(argument0);

#define qs_queue_head
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_queue_t) {
	var l_queue = argument0[1];
	if (l_queue >= 0) {
		return ds_queue_head(l_queue);
	} else qs_impl_queue_amiss(argument0);
} else qs_impl_queue_mismatch(argument0);

#define qs_queue_tail
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_queue_t) {
	var l_queue = argument0[1];
	if (l_queue >= 0) {
		return ds_queue_tail(l_queue);
	} else qs_impl_queue_amiss(argument0);
} else qs_impl_queue_mismatch(argument0);

#define qs_queue_write
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_queue_t) {
	var l_queue = argument0[1];
	if (l_queue >= 0) {
		return ds_queue_write(l_queue);
	} else qs_impl_queue_amiss(argument0);
} else qs_impl_queue_mismatch(argument0);

#define qs_queue_read
// (id,str)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_queue_t) {
	var l_queue = argument0[1];
	if (l_queue >= 0) {
		ds_queue_read(l_queue, argument1);
	} else qs_impl_queue_amiss(argument0);
} else qs_impl_queue_mismatch(argument0);

#define qs_impl_list_amiss
// (value)~
var l_stack = argument0[2], l_msg;
if (is_array(l_stack)) {
	l_msg = "This list is already destroyed from:";
	var l_ind = -1;
	repeat (array_length_1d(l_stack)) {
		var l_item = l_stack[++l_ind];
		if (is_string(l_item)) {
			l_msg += chr(13) + chr(10) + "  " + l_item;
		}
	}
} else {
	l_msg = "This list is already destroyed."
		+ chr(13) + chr(10) + "(qs_debug_callstack is disabled)";
}
show_error(l_msg, true);

#define qs_impl_list_mismatch
// (value)~
show_error("Expected a list, got " + qs_debug_dump(argument0), true);

#define qs_list_create
// ()
var l_list = [
	global.g_qs_list_t,
	ds_list_create(),
	qs_debug_callstack ? debug_get_callstack() : undefined,
];
if (qs_debug_active) global.g_qs_active_lists[?l_list[1]] = l_list[2];
return l_list;

#define qs_list_clear
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_list_t) {
	var l_list = argument0[1];
	if (l_list >= 0) {
		ds_list_clear(l_list);
	} else qs_impl_list_amiss(argument0);
} else qs_impl_list_mismatch(argument0);

#define qs_list_copy
// (id, source)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_list_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		if (array_length_1d(argument1) > 2 && argument1[0] == global.g_qs_list_t) {
			var l_val = argument1[1];
			if (l_val >= 0) {
				ds_list_copy(l_map, l_val);
			} else qs_impl_list_amiss(argument1);
		} else qs_impl_list_mismatch(argument1);
	} else qs_impl_list_amiss(argument0);
} else qs_impl_list_mismatch(argument0);

#define qs_list_size
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_list_t) {
	var l_list = argument0[1];
	if (l_list >= 0) {
		return ds_list_size(l_list);
	} else qs_impl_list_amiss(argument0);
} else qs_impl_list_mismatch(argument0);

#define qs_list_empty
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_list_t) {
	var l_list = argument0[1];
	if (l_list >= 0) {
		return ds_list_empty(l_list);
	} else qs_impl_list_amiss(argument0);
} else qs_impl_list_mismatch(argument0);

#define qs_list_insert
// (id,pos,value)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_list_t) {
	var l_list = argument0[1];
	if (l_list >= 0) {
		ds_list_insert(l_list, argument1, argument2);
	} else qs_impl_list_amiss(argument0);
} else qs_impl_list_mismatch(argument0);

#define qs_list_replace
// (id,pos,value)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_list_t) {
	var l_list = argument0[1];
	if (l_list >= 0) {
		ds_list_replace(l_list, argument1, argument2);
	} else qs_impl_list_amiss(argument0);
} else qs_impl_list_mismatch(argument0);

#define qs_list_delete
// (id,pos)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_list_t) {
	var l_list = argument0[1];
	if (l_list >= 0) {
		ds_list_delete(l_list, argument1);
	} else qs_impl_list_amiss(argument0);
} else qs_impl_list_mismatch(argument0);

#define qs_list_sort
// (id,ascending)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_list_t) {
	var l_list = argument0[1];
	if (l_list >= 0) {
		ds_list_sort(l_list, argument1);
	} else qs_impl_list_amiss(argument0);
} else qs_impl_list_mismatch(argument0);

#define qs_list_shuffle
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_list_t) {
	var l_list = argument0[1];
	if (l_list >= 0) {
		ds_list_shuffle(l_list);
	} else qs_impl_list_amiss(argument0);
} else qs_impl_list_mismatch(argument0);

#define qs_list_read
// (id,str)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_list_t) {
	var l_list = argument0[1];
	if (l_list >= 0) {
		ds_list_read(l_list, argument1);
	} else qs_impl_list_amiss(argument0);
} else qs_impl_list_mismatch(argument0);

#define qs_list_set
// (id,pos,value)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_list_t) {
	var l_list = argument0[1];
	if (l_list >= 0) {
		ds_list_set(l_list, argument1, argument2);
	} else qs_impl_list_amiss(argument0);
} else qs_impl_list_mismatch(argument0);

#define qs_impl_map_amiss
// (value)~
var l_stack = argument0[2], l_msg;
if (is_array(l_stack)) {
	l_msg = "This map is already destroyed from:";
	var l_ind = -1;
	repeat (array_length_1d(l_stack)) {
		var l_item = l_stack[++l_ind];
		if (is_string(l_item)) {
			l_msg += chr(13) + chr(10) + "  " + l_item;
		}
	}
} else {
	l_msg = "This map is already destroyed."
		+ chr(13) + chr(10) + "(qs_debug_callstack is disabled)";
}
show_error(l_msg, true);

#define qs_impl_map_mismatch
// (value)~
show_error("Expected a map, got " + qs_debug_dump(argument0), true);

#define qs_map_create
// ()
var l_map = [
	global.g_qs_map_t,
	ds_map_create(),
	qs_debug_callstack ? debug_get_callstack() : undefined,
];
if (qs_debug_active) global.g_qs_active_maps[?l_map[1]] = l_map[2];
return l_map;

#define qs_map_clear
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_map_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		ds_map_clear(l_map);
	} else qs_impl_map_amiss(argument0);
} else qs_impl_map_mismatch(argument0);

#define qs_map_copy
// (id, source)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_map_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		if (array_length_1d(argument1) > 2 && argument1[0] == global.g_qs_map_t) {
			var l_val = argument1[1];
			if (l_val >= 0) {
				ds_map_copy(l_map, l_val);
			} else qs_impl_map_amiss(argument1);
		} else qs_impl_map_mismatch(argument1);
	} else qs_impl_map_amiss(argument0);
} else qs_impl_map_mismatch(argument0);

#define qs_map_size
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_map_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		return ds_map_size(l_map);
	} else qs_impl_map_amiss(argument0);
} else qs_impl_map_mismatch(argument0);

#define qs_map_empty
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_map_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		return ds_map_empty(l_map);
	} else qs_impl_map_amiss(argument0);
} else qs_impl_map_mismatch(argument0);

#define qs_map_add
// (id,key,value)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_map_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		ds_map_add(l_map, argument1, argument2);
	} else qs_impl_map_amiss(argument0);
} else qs_impl_map_mismatch(argument0);

#define qs_map_replace
// (id,key,value)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_map_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		ds_map_replace(l_map, argument1, argument2);
	} else qs_impl_map_amiss(argument0);
} else qs_impl_map_mismatch(argument0);

#define qs_map_delete
// (id,key)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_map_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		ds_map_delete(l_map, argument1);
	} else qs_impl_map_amiss(argument0);
} else qs_impl_map_mismatch(argument0);

#define qs_map_exists
// (id,key)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_map_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		return ds_map_exists(l_map, argument1);
	} else qs_impl_map_amiss(argument0);
} else qs_impl_map_mismatch(argument0);

#define qs_map_find_previous
// (id,key)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_map_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		return ds_map_find_previous(l_map, argument1);
	} else qs_impl_map_amiss(argument0);
} else qs_impl_map_mismatch(argument0);

#define qs_map_find_next
// (id,key)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_map_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		return ds_map_find_next(l_map, argument1);
	} else qs_impl_map_amiss(argument0);
} else qs_impl_map_mismatch(argument0);

#define qs_map_find_first
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_map_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		return ds_map_find_first(l_map);
	} else qs_impl_map_amiss(argument0);
} else qs_impl_map_mismatch(argument0);

#define qs_map_find_last
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_map_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		return ds_map_find_last(l_map);
	} else qs_impl_map_amiss(argument0);
} else qs_impl_map_mismatch(argument0);

#define qs_map_read
// (id,str)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_map_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		ds_map_read(l_map, argument1);
	} else qs_impl_map_amiss(argument0);
} else qs_impl_map_mismatch(argument0);

#define qs_map_set
// (id,key,value)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_map_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		ds_map_set(l_map, argument1, argument2);
	} else qs_impl_map_amiss(argument0);
} else qs_impl_map_mismatch(argument0);

#define qs_impl_priority_amiss
// (value)~
var l_stack = argument0[2], l_msg;
if (is_array(l_stack)) {
	l_msg = "This priority is already destroyed from:";
	var l_ind = -1;
	repeat (array_length_1d(l_stack)) {
		var l_item = l_stack[++l_ind];
		if (is_string(l_item)) {
			l_msg += chr(13) + chr(10) + "  " + l_item;
		}
	}
} else {
	l_msg = "This priority is already destroyed."
		+ chr(13) + chr(10) + "(qs_debug_callstack is disabled)";
}
show_error(l_msg, true);

#define qs_impl_priority_mismatch
// (value)~
show_error("Expected a priority, got " + qs_debug_dump(argument0), true);

#define qs_priority_create
// ()
var l_priority = [
	global.g_qs_priority_t,
	ds_priority_create(),
	qs_debug_callstack ? debug_get_callstack() : undefined,
];
if (qs_debug_active) global.g_qs_active_priorities[?l_priority[1]] = l_priority[2];
return l_priority;

#define qs_priority_destroy
// (priority)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_priority_t) {
	var l_priority = argument0[1];
	if (l_priority >= 0) {
		ds_priority_destroy(argument0[1]);
		if (qs_debug_active) ds_map_delete(global.g_qs_active_priorities, argument0[1]);
		argument0[@1] = -1;
		argument0[@2] = qs_debug_callstack ? debug_get_callstack() : undefined;
	} else qs_impl_priority_amiss(argument0);
} else qs_impl_priority_mismatch(argument0);

#define qs_priority_clear
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_priority_t) {
	var l_priority = argument0[1];
	if (l_priority >= 0) {
		ds_priority_clear(l_priority);
	} else qs_impl_priority_amiss(argument0);
} else qs_impl_priority_mismatch(argument0);

#define qs_priority_copy
// (id, source)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_priority_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		if (array_length_1d(argument1) > 2 && argument1[0] == global.g_qs_priority_t) {
			var l_val = argument1[1];
			if (l_val >= 0) {
				ds_priority_copy(l_map, l_val);
			} else qs_impl_priority_amiss(argument1);
		} else qs_impl_priority_mismatch(argument1);
	} else qs_impl_priority_amiss(argument0);
} else qs_impl_priority_mismatch(argument0);

#define qs_priority_size
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_priority_t) {
	var l_priority = argument0[1];
	if (l_priority >= 0) {
		return ds_priority_size(l_priority);
	} else qs_impl_priority_amiss(argument0);
} else qs_impl_priority_mismatch(argument0);

#define qs_priority_empty
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_priority_t) {
	var l_priority = argument0[1];
	if (l_priority >= 0) {
		return ds_priority_empty(l_priority);
	} else qs_impl_priority_amiss(argument0);
} else qs_impl_priority_mismatch(argument0);

#define qs_priority_add
// (id,value,priority)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_priority_t) {
	var l_priority = argument0[1];
	if (l_priority >= 0) {
		ds_priority_add(l_priority, argument1, argument2);
	} else qs_impl_priority_amiss(argument0);
} else qs_impl_priority_mismatch(argument0);

#define qs_priority_change_priority
// (id,value,priority)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_priority_t) {
	var l_priority = argument0[1];
	if (l_priority >= 0) {
		ds_priority_change_priority(l_priority, argument1, argument2);
	} else qs_impl_priority_amiss(argument0);
} else qs_impl_priority_mismatch(argument0);

#define qs_priority_find_priority
// (id,value)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_priority_t) {
	var l_priority = argument0[1];
	if (l_priority >= 0) {
		return ds_priority_find_priority(l_priority, argument1);
	} else qs_impl_priority_amiss(argument0);
} else qs_impl_priority_mismatch(argument0);

#define qs_priority_delete_value
// (id,value)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_priority_t) {
	var l_priority = argument0[1];
	if (l_priority >= 0) {
		ds_priority_delete_value(l_priority, argument1);
	} else qs_impl_priority_amiss(argument0);
} else qs_impl_priority_mismatch(argument0);

#define qs_priority_delete_min
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_priority_t) {
	var l_priority = argument0[1];
	if (l_priority >= 0) {
		ds_priority_delete_min(l_priority);
	} else qs_impl_priority_amiss(argument0);
} else qs_impl_priority_mismatch(argument0);

#define qs_priority_find_min
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_priority_t) {
	var l_priority = argument0[1];
	if (l_priority >= 0) {
		return ds_priority_find_min(l_priority);
	} else qs_impl_priority_amiss(argument0);
} else qs_impl_priority_mismatch(argument0);

#define qs_priority_delete_max
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_priority_t) {
	var l_priority = argument0[1];
	if (l_priority >= 0) {
		ds_priority_delete_max(l_priority);
	} else qs_impl_priority_amiss(argument0);
} else qs_impl_priority_mismatch(argument0);

#define qs_priority_find_max
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_priority_t) {
	var l_priority = argument0[1];
	if (l_priority >= 0) {
		return ds_priority_find_max(l_priority);
	} else qs_impl_priority_amiss(argument0);
} else qs_impl_priority_mismatch(argument0);

#define qs_priority_write
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_priority_t) {
	var l_priority = argument0[1];
	if (l_priority >= 0) {
		return ds_priority_write(l_priority);
	} else qs_impl_priority_amiss(argument0);
} else qs_impl_priority_mismatch(argument0);

#define qs_priority_read
// (id,str)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_priority_t) {
	var l_priority = argument0[1];
	if (l_priority >= 0) {
		ds_priority_read(l_priority, argument1);
	} else qs_impl_priority_amiss(argument0);
} else qs_impl_priority_mismatch(argument0);

#define qs_impl_grid_amiss
// (value)~
var l_stack = argument0[2], l_msg;
if (is_array(l_stack)) {
	l_msg = "This grid is already destroyed from:";
	var l_ind = -1;
	repeat (array_length_1d(l_stack)) {
		var l_item = l_stack[++l_ind];
		if (is_string(l_item)) {
			l_msg += chr(13) + chr(10) + "  " + l_item;
		}
	}
} else {
	l_msg = "This grid is already destroyed."
		+ chr(13) + chr(10) + "(qs_debug_callstack is disabled)";
}
show_error(l_msg, true);

#define qs_impl_grid_mismatch
// (value)~
show_error("Expected a grid, got " + qs_debug_dump(argument0), true);

#define qs_grid_create
// (w,h)
var l_grid = [
	global.g_qs_grid_t,
	ds_grid_create(argument0, argument1),
	qs_debug_callstack ? debug_get_callstack() : undefined,
];
if (qs_debug_active) global.g_qs_active_grids[?l_grid[1]] = l_grid[2];
return l_grid;

#define qs_grid_destroy
// (grid)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		ds_grid_destroy(argument0[1]);
		if (qs_debug_active) ds_map_delete(global.g_qs_active_grids, argument0[1]);
		argument0[@1] = -1;
		argument0[@2] = qs_debug_callstack ? debug_get_callstack() : undefined;
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_copy
// (id, source)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_map = argument0[1];
	if (l_map >= 0) {
		if (array_length_1d(argument1) > 2 && argument1[0] == global.g_qs_grid_t) {
			var l_val = argument1[1];
			if (l_val >= 0) {
				ds_grid_copy(l_map, l_val);
			} else qs_impl_grid_amiss(argument1);
		} else qs_impl_grid_mismatch(argument1);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_resize
// (id,w,h)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		ds_grid_resize(l_grid, argument1, argument2);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_width
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		return ds_grid_width(l_grid);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_height
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		return ds_grid_height(l_grid);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_clear
// (id,val)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		ds_grid_clear(l_grid, argument1);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_set
// (id,x,y,val)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		ds_grid_set(l_grid, argument1, argument2, argument3);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_add
// (id,x,y,val)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		ds_grid_add(l_grid, argument1, argument2, argument3);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_multiply
// (id,x,y,val)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		ds_grid_multiply(l_grid, argument1, argument2, argument3);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_set_region
// (id,x1,y1,x2,y2,val)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		ds_grid_set_region(l_grid, argument1, argument2, argument3, argument4, argument5);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_add_region
// (id,x1,y1,x2,y2,val)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		ds_grid_add_region(l_grid, argument1, argument2, argument3, argument4, argument5);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_multiply_region
// (id,x1,y1,x2,y2,val)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		ds_grid_multiply_region(l_grid, argument1, argument2, argument3, argument4, argument5);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_set_disk
// (id,xm,ym,r,val)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		ds_grid_set_disk(l_grid, argument1, argument2, argument3, argument4);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_add_disk
// (id,xm,ym,r,val)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		ds_grid_add_disk(l_grid, argument1, argument2, argument3, argument4);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_multiply_disk
// (id,xm,ym,r,val)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		ds_grid_multiply_disk(l_grid, argument1, argument2, argument3, argument4);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_get
// (id,x,y)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		return ds_grid_get(l_grid, argument1, argument2);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_get_sum
// (id,x1,y1,x2,y2)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		return ds_grid_get_sum(l_grid, argument1, argument2, argument3, argument4);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_get_max
// (id,x1,y1,x2,y2)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		return ds_grid_get_max(l_grid, argument1, argument2, argument3, argument4);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_get_min
// (id,x1,y1,x2,y2)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		return ds_grid_get_min(l_grid, argument1, argument2, argument3, argument4);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_get_mean
// (id,x1,y1,x2,y2)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		return ds_grid_get_mean(l_grid, argument1, argument2, argument3, argument4);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_get_disk_sum
// (id,xm,ym,r)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		return ds_grid_get_disk_sum(l_grid, argument1, argument2, argument3);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_get_disk_min
// (id,xm,ym,r)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		return ds_grid_get_disk_min(l_grid, argument1, argument2, argument3);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_get_disk_max
// (id,xm,ym,r)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		return ds_grid_get_disk_max(l_grid, argument1, argument2, argument3);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_get_disk_mean
// (id,xm,ym,r)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		return ds_grid_get_disk_mean(l_grid, argument1, argument2, argument3);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_value_exists
// (id,x1,y1,x2,y2,val)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		return ds_grid_value_exists(l_grid, argument1, argument2, argument3, argument4, argument5);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_value_x
// (id,x1,y1,x2,y2,val)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		return ds_grid_value_x(l_grid, argument1, argument2, argument3, argument4, argument5);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_value_y
// (id,x1,y1,x2,y2,val)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		return ds_grid_value_y(l_grid, argument1, argument2, argument3, argument4, argument5);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_value_disk_exists
// (id,xm,ym,r,val)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		return ds_grid_value_disk_exists(l_grid, argument1, argument2, argument3, argument4);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_value_disk_x
// (id,xm,ym,r,val)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		return ds_grid_value_disk_x(l_grid, argument1, argument2, argument3, argument4);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_value_disk_y
// (id,xm,ym,r,val)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		return ds_grid_value_disk_y(l_grid, argument1, argument2, argument3, argument4);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_shuffle
// (id)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		ds_grid_shuffle(l_grid);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_read
// (id,str)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		ds_grid_read(l_grid, argument1);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

#define qs_grid_sort
// (id,column,ascending)
if (array_length_1d(argument0) > 2 && argument0[0] == global.g_qs_grid_t) {
	var l_grid = argument0[1];
	if (l_grid >= 0) {
		ds_grid_sort(l_grid, argument1, argument2);
	} else qs_impl_grid_amiss(argument0);
} else qs_impl_grid_mismatch(argument0);

// Thought we were done? Here come the JSON functions
#define qs_json_std_mathnf_init
return argument[0]/argument[1];

#define qs_json_error
g_qs_json_error_text=argument[1]+" at position "+string(argument[0])+".";
return global.g_qs_error;

#define qs_json_decode_uxc
var l_pos=argument[0];
var l_b=buffer_peek(g_qs_json_buffer,l_pos,buffer_u8);
if(l_b<128){
	g_qs_json_error_text="Unexpected character `"+chr(l_b)+"` at position "+string(l_pos)+".";
	return global.g_qs_error;
} else {
	g_qs_json_error_text="Unexpected character <unicode> at position "+string(l_pos)+".";
	return global.g_qs_error;
}

#define qs_json_decode_string
var l_buf=g_qs_json_buffer;
var l_ofs=g_qs_json_offset;
var l_len=g_qs_json_length;
var l_out=g_qs_json_strbuf;
var l_orig=l_ofs;
var l_start=l_ofs;
while(l_ofs<l_len){
	var l_c=buffer_peek(l_buf,l_ofs++,buffer_u8);
	if(l_c==34){
		g_qs_json_offset=l_ofs;
		if(l_start==l_orig){
			buffer_poke(l_buf,l_ofs-1,buffer_u8,0);
			buffer_seek(l_buf,buffer_seek_start,l_start);
			return buffer_read(l_buf,buffer_string);
		} else {
			qs_json_std_gml_io__Buffer_BufferImpl_writeBufferExt(l_out,l_buf,l_start,l_ofs-1-l_start);
			buffer_write(l_out,buffer_u8,0);
			buffer_seek(l_out,buffer_seek_start,0);
			return buffer_read(l_out,buffer_string);
		}
	} else if(l_c==92){
		if(l_orig==l_start)buffer_seek(l_out,buffer_seek_start,0);
		qs_json_std_gml_io__Buffer_BufferImpl_writeBufferExt(l_out,l_buf,l_start,l_ofs-1-l_start);
		l_c=buffer_peek(l_buf,l_ofs++,buffer_u8);
		switch(l_c){
			case 114:buffer_write(l_out,buffer_u8,13);break;
			case 110:buffer_write(l_out,buffer_u8,10);break;
			case 116:buffer_write(l_out,buffer_u8,9);break;
			case 98:buffer_write(l_out,buffer_u8,8);break;
			case 102:buffer_write(l_out,buffer_u8,12);break;
			case 34:case 47:case 92:buffer_write(l_out,buffer_u8,l_c);break;
			case 117:
				var l_uc=0;
				repeat (4) {
					l_c=buffer_peek(l_buf,l_ofs++,buffer_u8);
					if(l_c>=48&&l_c<=57){
						l_c-=48;
					} else if(l_c>=65&&l_c<=70){
						l_c-=55;
					} else if(l_c>=97&&l_c<=102){
						l_c-=87;
					} else l_c=0;
					l_uc=((l_uc<<4)|l_c);
				}
				if(l_uc<=127){
					buffer_write(l_out,buffer_u8,l_uc);
				} else if(l_uc<=2047){
					buffer_write(l_out,buffer_u8,(192|(l_uc>>6)));
					buffer_write(l_out,buffer_u8,(128|(l_uc&63)));
				} else if(l_uc<=65535){
					buffer_write(l_out,buffer_u8,(224|(l_uc>>12)));
					buffer_write(l_out,buffer_u8,(128|((l_uc>>6)&63)));
					buffer_write(l_out,buffer_u8,(128|(l_uc&63)));
				} else {
					buffer_write(l_out,buffer_u8,(240|(l_uc>>18)));
					buffer_write(l_out,buffer_u8,(128|((l_uc>>12)&63)));
					buffer_write(l_out,buffer_u8,(128|((l_uc>>6)&63)));
					buffer_write(l_out,buffer_u8,(128|(l_uc&63)));
				}
				break;
			default:return qs_json_decode_uxc(l_ofs);
		}
		l_start=l_ofs;
	}
}
g_qs_json_error_text="Unclosed string at position "+string(l_orig-1)+".";
return global.g_qs_error;

#define qs_json_decode_number
var l_c=argument[0];
var l_buf=g_qs_json_buffer;
var l_ofs=g_qs_json_offset;
var l_len=g_qs_json_length;
var l_start=l_ofs-1;
var l_neg=l_c==45;
var l_dig=!l_neg;
var l_zero=l_c==48;
var l_dot=false;
var l_epo=-1;
var l_eso=-1;
var l_sub;
while(l_ofs<l_len){
	l_c=buffer_peek(l_buf,l_ofs++,buffer_u8);
	switch(l_c){
		case 48:
			if(l_zero&&!l_dot){
				g_qs_json_error_text="Invalid number at position "+string(l_start)+".";
				return global.g_qs_error;
			}
			if(l_neg){
				l_neg=false;
				l_zero=true;
			}
			l_dig=true;
			break;
		case 46:
			if(l_neg||l_dot){
				g_qs_json_error_text="Invalid number at position "+string(l_start)+".";
				return global.g_qs_error;
			}
			l_dig=false;
			l_dot=true;
			break;
		case 69:case 101:
			if(l_neg||l_epo>=0){
				g_qs_json_error_text="Invalid number at position "+string(l_start)+".";
				return global.g_qs_error;
			}
			l_dig=false;
			l_epo=l_ofs;
			break;
		case 43:case 45:
			if(l_epo<0||l_eso>=0){
				g_qs_json_error_text="Invalid number at position "+string(l_start)+".";
				return global.g_qs_error;
			}
			l_dig=false;
			l_eso=l_ofs;
			break;
		default:
			if(l_c>=49&&l_c<=57){
				if(l_zero&&!l_dot){
					g_qs_json_error_text="Invalid number at position "+string(l_start)+".";
					return global.g_qs_error;
				}
				l_dig=true;
				l_zero=false;
				l_neg=false;
			} else {
				if(!l_dig){
					g_qs_json_error_text="Invalid number at position "+string(l_start)+".";
					return global.g_qs_error;
				}
				--l_ofs;
				if(l_epo==l_ofs||l_eso==l_ofs){
					g_qs_json_error_text="Invalid number at position "+string(l_start)+".";
					return global.g_qs_error;
				} else {
					l_c=(l_ofs<l_len?buffer_peek(l_buf,l_ofs,buffer_u8):-1);
					g_qs_json_offset=l_ofs;
					if(l_c>=0)buffer_poke(l_buf,l_ofs,buffer_u8,0);
					buffer_seek(l_buf,buffer_seek_start,l_start);
					l_sub=buffer_read(l_buf,buffer_string);
					if(l_c>=0)buffer_poke(l_buf,l_ofs,buffer_u8,l_c);
					return qs_json_std_Std_parseFloat(l_sub);
				}
			}
	}
}
if(l_epo==l_ofs||l_eso==l_ofs){
	g_qs_json_error_text="Invalid number at position "+string(l_start)+".";
	return global.g_qs_error;
} else {
	l_c=(l_ofs<l_len?buffer_peek(l_buf,l_ofs,buffer_u8):-1);
	g_qs_json_offset=l_ofs;
	if(l_c>=0)buffer_poke(l_buf,l_ofs,buffer_u8,0);
	buffer_seek(l_buf,buffer_seek_start,l_start);
	l_sub=buffer_read(l_buf,buffer_string);
	if(l_c>=0)buffer_poke(l_buf,l_ofs,buffer_u8,l_c);
	return qs_json_std_Std_parseFloat(l_sub);
}

#define qs_json_decode_rec
var l_buf=g_qs_json_buffer;
var l_ofs=g_qs_json_offset;
var l_len=g_qs_json_length;
var l_start,l_sep,l_sub,l_num,l_key,l_val,l_hasMark;
while(l_ofs<l_len){
	var l_c=buffer_peek(l_buf,l_ofs++,buffer_u8);
	switch(l_c){
		case 9:case 10:case 13:case 32:break;
		case 123:
			l_start=l_ofs;
			var l_h=ds_map_create();
			l_hasMark=false;
			l_sep=true;
			while(l_ofs<l_len){
				l_c=buffer_peek(l_buf,l_ofs++,buffer_u8);
				switch(l_c){
					case 9:case 10:case 13:case 32:break;
					case 125:
						g_qs_json_offset=l_ofs;
						l_val=[global.g_qs_map_t,l_h,(qs_debug_callstack?debug_get_callstack():undefined)];
						if(qs_debug_active)global.g_qs_active_maps[?l_h]=l_val[2];
						if(l_hasMark)l_val[@3]=global.g_qs_has_mark_t;
						return l_val;
					case 44:
						if(l_sep){
							var l_val4=qs_json_decode_uxc(l_ofs);
							ds_map_destroy(l_h);
							return l_val4;
						}
						l_sep=true;
						break;
					default:
						if(l_c!=34||!l_sep){
							var l_val5=qs_json_decode_uxc(l_ofs);
							ds_map_destroy(l_h);
							return l_val5;
						}
						g_qs_json_offset=l_ofs;
						l_key=qs_json_decode_string();
						if(l_key==global.g_qs_error){
							ds_map_destroy(l_h);
							return l_key;
						}
						l_ofs=g_qs_json_offset;
						while(l_ofs<l_len){
							l_c=buffer_peek(l_buf,l_ofs++,buffer_u8);
							switch(l_c){
								case 9:case 10:case 13:case 32:continue;
							}
							if(l_c!=58){
								var l_val6=qs_json_decode_uxc(l_ofs);
								ds_map_destroy(l_h);
								return l_val6;
							} else break;
						}
						g_qs_json_offset=l_ofs;
						l_val=qs_json_decode_rec();
						if(l_val==global.g_qs_error){
							ds_map_destroy(l_h);
							return l_val;
						}
						if(array_length_1d(l_val)>2&&(l_val[0]==global.g_qs_list_t||l_val[0]==global.g_qs_map_t)){
							l_val=[global.g_qs_mark_t,l_val];
							l_hasMark=true;
						}
						l_ofs=g_qs_json_offset;
						l_h[?l_key]=l_val;
						l_sep=false;
				}
			}
			g_qs_json_error_text="Unclosed {} at position "+string(l_start)+".";
			var l_val7=global.g_qs_error;
			ds_map_destroy(l_h);
			return l_val7;
		case 91:
			l_start=l_ofs;
			var l_l=ds_list_create();
			l_hasMark=false;
			l_sep=true;
			while(l_ofs<l_len){
				l_c=buffer_peek(l_buf,l_ofs++,buffer_u8);
				switch(l_c){
					case 9:case 10:case 13:case 32:break;
					case 44:
						if(l_sep){
							var l_val1=qs_json_decode_uxc(l_ofs);
							ds_list_destroy(l_l);
							return l_val1;
						}
						l_sep=true;
						break;
					case 93:
						g_qs_json_offset=l_ofs;
						l_val=[global.g_qs_list_t,l_l,(qs_debug_callstack?debug_get_callstack():undefined)];
						if(qs_debug_active)global.g_qs_active_lists[?l_l]=l_val[2];
						if(l_hasMark)l_val[@3]=global.g_qs_has_mark_t;
						return l_val;
					default:
						if(l_sep){
							g_qs_json_offset=l_ofs-1;
							l_val=qs_json_decode_rec();
							if(l_val==global.g_qs_error){
								ds_list_destroy(l_l);
								return l_val;
							}
							if(array_length_1d(l_val)>2&&(l_val[0]==global.g_qs_list_t||l_val[0]==global.g_qs_map_t)){
								l_val=[global.g_qs_mark_t,l_val];
								l_hasMark=true;
							}
							ds_list_add(l_l,l_val);
							l_ofs=g_qs_json_offset;
							l_sep=false;
						} else {
							var l_val2=qs_json_decode_uxc(l_ofs);
							ds_list_destroy(l_l);
							return l_val2;
						}
				}
			}
			g_qs_json_error_text="Unclosed [] at position "+string(l_start)+".";
			var l_val3=global.g_qs_error;
			ds_list_destroy(l_l);
			return l_val3;
		case 34:
			g_qs_json_offset=l_ofs;
			l_val=qs_json_decode_string();
			return l_val;
		case 45:
			g_qs_json_offset=l_ofs;
			l_val=qs_json_decode_number(45);
			return l_val;
		case 116:
			l_start=l_ofs;
			if(buffer_peek(l_buf,l_ofs++,buffer_u8)!=114)return qs_json_decode_uxc(l_start);
			if(buffer_peek(l_buf,l_ofs++,buffer_u8)!=117)return qs_json_decode_uxc(l_start);
			if(buffer_peek(l_buf,l_ofs++,buffer_u8)!=101)return qs_json_decode_uxc(l_start);
			g_qs_json_offset=l_ofs;
			return bool(true);
		case 102:
			l_start=l_ofs;
			if(buffer_peek(l_buf,l_ofs++,buffer_u8)!=97)return qs_json_decode_uxc(l_start);
			if(buffer_peek(l_buf,l_ofs++,buffer_u8)!=108)return qs_json_decode_uxc(l_start);
			if(buffer_peek(l_buf,l_ofs++,buffer_u8)!=115)return qs_json_decode_uxc(l_start);
			if(buffer_peek(l_buf,l_ofs++,buffer_u8)!=101)return qs_json_decode_uxc(l_start);
			g_qs_json_offset=l_ofs;
			return bool(false);
		case 110:
			l_start=l_ofs;
			if(buffer_peek(l_buf,l_ofs++,buffer_u8)!=117)return qs_json_decode_uxc(l_start);
			if(buffer_peek(l_buf,l_ofs++,buffer_u8)!=108)return qs_json_decode_uxc(l_start);
			if(buffer_peek(l_buf,l_ofs++,buffer_u8)!=108)return qs_json_decode_uxc(l_start);
			g_qs_json_offset=l_ofs;
			return undefined;
		default:
			if(l_c>=48&&l_c<=57){
				g_qs_json_offset=l_ofs;
				l_val=qs_json_decode_number(l_c);
				return l_val;
			} else return qs_json_decode_uxc(l_ofs);
	}
}
g_qs_json_error_text="Unexpected end of input at position "+string(l_ofs)+".";
return global.g_qs_error;

#define qs_json_decode
// (json_string)
var l_b=g_qs_json_buffer;
buffer_seek(l_b,buffer_seek_start,0);
buffer_write(l_b,buffer_text,argument[0]);
g_qs_json_offset=0;
g_qs_json_length=buffer_get_size(l_b);
var l_val=qs_json_decode_rec();
if(l_val==global.g_qs_error){
	show_debug_message(g_qs_json_error_text);
	return -1;
} else if(l_val[0]==global.g_qs_map_t){
	return l_val;
} else {
	var l_h=ds_map_create();
	l_h[?"default"]=l_val;
	return [global.g_qs_map_t,l_h,(qs_debug_callstack?debug_get_callstack():undefined)];
}

#define qs_json_encode_str
var l_val=argument[0];
var l_buf=g_qs_json_buffer;
if(string_length(l_val)==0){
	buffer_write(l_buf,buffer_text,"\"\"");
	return 0;
}
var l_str=g_qs_json_strbuf;
buffer_seek(l_str,buffer_seek_start,0);
buffer_write(l_str,buffer_text,l_val);
var l_start=0;
buffer_write(l_buf,buffer_u8,34);
var l_len=buffer_tell(l_str);
var l_esc=g_qs_json_encode_str_esc;
var l_ofs=0;
repeat (l_len) {
	var l_e=l_esc[buffer_peek(l_str,l_ofs,buffer_u8)];
	if(l_e>=0){
		if(l_ofs>l_start)qs_json_std_gml_io__Buffer_BufferImpl_writeBufferExt(l_buf,l_str,l_start,l_ofs-l_start);
		buffer_write(l_buf,buffer_u8,92);
		buffer_write(l_buf,buffer_u8,l_e);
		l_start=l_ofs+1;
	}
	++l_ofs;
}
if(l_start==0){
	buffer_write(l_buf,buffer_text,l_val);
} else if(l_ofs>l_start){
	qs_json_std_gml_io__Buffer_BufferImpl_writeBufferExt(l_buf,l_str,l_start,l_ofs-l_start);
}
buffer_write(l_buf,buffer_u8,34);

#define qs_json_encode_warn
var l_msg=argument[0],l_val=argument[1];
var l_lv=qs_debug_json_encode;
if(l_lv<=0)return 0;
l_msg+=": ["+typeof(l_val)+"] "+qs_json_std_Std_string(l_val);
if(l_lv>1)show_error(l_msg,l_lv>2); else show_debug_message(l_msg);

#define qs_json_encode_rec
var l_what=argument[0],l_depth=argument[1];
var l_buf=g_qs_json_buffer;
var l_sep,l_v,l_i;
if(l_depth>qs_option_max_json_depth){
	qs_json_encode_warn("Maximum encoding depth ("+string(qs_option_max_json_depth)+") exceeded, check for circular references.",l_what);
	buffer_write(l_buf,buffer_text,"null");
	return 0;
}
if(l_what==undefined){
	buffer_write(l_buf,buffer_text,"null");
	return 0;
}
var l_isArray1=is_array(l_what);
var l_sizeof=(l_isArray1?array_length_1d(l_what):-1);
var l_isMark=l_sizeof>1&&l_what[0]==global.g_qs_mark_t;
if(l_isMark){
	l_what=l_what[1];
	l_isArray1=is_array(l_what);
	l_sizeof=(l_isArray1?array_length_1d(l_what):-1);
}
if(l_sizeof>2){
	if(l_what[0]==global.g_qs_map_t){
		if(l_isMark||l_depth==0||qs_option_no_json_mark){
			var l_h=l_what[1];
			if(!ds_exists(l_h,ds_type_map)){
				buffer_write(l_buf,buffer_text,"null");
				return 0;
			}
			buffer_write(l_buf,buffer_u8,123);
			var l_k=ds_map_find_first(l_h);
			l_sep=false;
			repeat (ds_map_size(l_h)) {
				if(l_sep)buffer_write(l_buf,buffer_u8,44); else l_sep=true;
				if(qs_json_std_gml_NativeTypeHelper_isNumber(l_k)){
					buffer_write(l_buf,buffer_u8,34);
					buffer_write(l_buf,buffer_text,l_k);
					buffer_write(l_buf,buffer_u8,34);
				} else if(is_string(l_k)){
					qs_json_encode_str(l_k);
				} else qs_json_encode_warn("JSON does not support non-string/number keys",l_k);
				buffer_write(l_buf,buffer_u8,58);
				qs_json_encode_rec(l_h[?l_k],l_depth+1);
				l_k=ds_map_find_next(l_h,l_k);
			}
			buffer_write(l_buf,buffer_u8,125);
		} else {
			qs_json_encode_warn("This map wasn't marked and thus is written as a number",l_what);
			buffer_write(l_buf,buffer_text,qs_json_std_Std_string(l_what[1]));
		}
		return 0;
	}
	if(l_what[0]==global.g_qs_list_t){
		if(l_isMark||l_depth==0||qs_option_no_json_mark){
			var l_l=l_what[1];
			if(!ds_exists(l_l,ds_type_list)){
				buffer_write(l_buf,buffer_text,"null");
				return 0;
			}
			buffer_write(l_buf,buffer_u8,91);
			l_i=-1;
			repeat (ds_list_size(l_l)) {
				if(++l_i>0)buffer_write(l_buf,buffer_u8,44);
				qs_json_encode_rec(l_l[|l_i],l_depth+1);
			}
			buffer_write(l_buf,buffer_u8,93);
		} else {
			qs_json_encode_warn("This list wasn't marked and thus is written as a number",l_what);
			buffer_write(l_buf,buffer_text,qs_json_std_Std_string(l_what[1]));
		}
		return 0;
	}
}
if(l_sizeof>=0){
	qs_json_encode_warn("Writing non-list arrays into JSON is undocumented behaviour",l_what);
	buffer_write(l_buf,buffer_u8,91);
	l_i=-1;
	repeat (array_length_1d(l_what)) {
		if(++l_i>0)buffer_write(l_buf,buffer_u8,44);
		qs_json_encode_rec(l_what[l_i],l_depth+1);
	}
	buffer_write(l_buf,buffer_u8,93);
	return 0;
}
if(is_string(l_what)){
	qs_json_encode_str(l_what);
	return 0;
}
if(qs_json_std_gml_NativeTypeHelper_isNumber(l_what)){
	buffer_write(l_buf,buffer_text,qs_json_std_Std_string(l_what));
	return 0;
}
qs_json_encode_warn("Not a supported JSON value",l_what);
qs_json_encode_str(qs_json_std_Std_string(l_what));

#define qs_json_encode
// (map)
var l_map=argument[0];
if(l_map[0]==global.g_qs_map_t){
	if(l_map[1]!=-1){
		var l_buf=g_qs_json_buffer;
		buffer_seek(l_buf,buffer_seek_start,0);
		qs_json_encode_rec(l_map,0);
		buffer_write(l_buf,buffer_u8,0);
		buffer_seek(l_buf,buffer_seek_start,0);
		return buffer_read(l_buf,buffer_string);
	} else qs_impl_map_amiss(l_map);
} else qs_impl_map_mismatch(l_map);
return "";

#define qs_json_std_Std_string
var l_value=argument[0];
if(l_value==undefined)return "null";
if(is_string(l_value))return l_value;
if(is_real(l_value)){
	var l_s=string_format(l_value,0,16);
	var l_n,l_i;
	if(os_browser!=-1){
		l_n=string_length(l_s);
		l_i=l_n;
		while(l_i>0){
			switch(string_ord_at(l_s,l_i)){
				case 48:
					--l_i;
					continue;
				case 46:--l_i;break;
			}
			break;
		}
	} else {
		l_n=string_byte_length(l_s);
		l_i=l_n;
		while(l_i>0){
			switch(string_byte_at(l_s,l_i)){
				case 48:
					--l_i;
					continue;
				case 46:--l_i;break;
			}
			break;
		}
	}
	return string_copy(l_s,1,l_i);
}
return string(l_value);

#define qs_json_std_Std_parseFloat
var l_s=argument[0];
var l_n=string_length(string_digits(l_s));
var l_p=string_pos(".",l_s);
var l_e=string_pos("e",l_s);
switch(l_e){
	case 0:break;
	case 1:return qs_json_std_mathnf_not_a_number;
	case 2:if(l_p>0)return qs_json_std_mathnf_not_a_number;break;
	default:if(l_p>0&&l_e<l_p)return qs_json_std_mathnf_not_a_number;
}
if(l_n&&l_n==string_length(l_s)-(string_ord_at(l_s,1)==45)-(l_p!=0)-(l_e!=0))return real(l_s); else return qs_json_std_mathnf_not_a_number;

#define qs_json_std_gml_NativeTypeHelper_isNumber
var l_v=argument[0];
return (is_real(l_v)||is_bool(l_v)||is_int32(l_v))||is_int64(l_v);

#define qs_json_std_gml_io__Buffer_BufferImpl_writeBufferExt
var l_dst=argument[0],l_src=argument[1],l_srcLen=argument[3];
var l_dstPos=buffer_tell(l_dst);
var l_dstNext=l_dstPos+l_srcLen;
var l_dstSize=buffer_get_size(l_dst);
if(l_dstNext>l_dstSize){
	if(buffer_get_type(l_dst)==buffer_grow){
		while(true){
			l_dstSize*=2;
			if(!(l_dstNext>l_dstSize))break;
		}
		buffer_resize(l_dst,l_dstSize);
	} else return false;
}
buffer_copy(l_src,argument[2],l_srcLen,l_dst,l_dstPos);
buffer_seek(l_dst,buffer_seek_start,l_dstNext);
return true;
